import re

def process_line(line):
    # Regex to match: name("str", "str", ...);
    match = re.match(r'^\s*([a-zA-Z_]\w*)\s*\(([^)]*)\);', line)
    if not match:
        return line  # Copy unchanged

    print (match)

    name = match.group(1)
    args = match.group(2)

    # Extract all strings (assumes quoted, comma-separated)
    strings = [s.strip().strip('"') for s in args.split(',') if s.strip()]
    output_strings = []
    remaining_strings = []

    # Pattern for i.. or v..
    ignore_pattern = re.compile(r'^[iv]\d+$')

    for s in strings:
        if ignore_pattern.match(s):
            remaining_strings.append(s)
        else:
            output_strings.append(s)

    # If no output strings, leave line unchanged
    if not output_strings:
        return line

    # Reconstruct line
    out_str = ', '.join(f'{s}' for s in output_strings)
    rem_str = ', '.join(f'{s}' for s in remaining_strings)
    new_line = f'[{out_str}] = {name}({rem_str});\n'
    return new_line

def fixAceGenMatlabFncCalls(input_path):
    with open(input_path, 'r') as infile:
        lines = infile.readlines()
    with open(input_path, 'w') as outfile:
        for line in lines:
            outfile.write(process_line(line))


def remove_duplicate_final_end(input_path):
    with open(input_path, 'r') as f:
        lines = f.readlines()

    # Check if last two lines are both 'end' (ignoring whitespace)
    if len(lines) >= 2:
        if lines[-1].strip() == 'end' and lines[-2].strip() == 'end':
            # Remove the last 'end'
            lines = lines[:-1]

    with open(input_path, 'w') as f:
        f.writelines(lines)


def add_end_to_matlab_functions(input_path):
    with open(input_path, 'r') as infile:
        lines = infile.readlines()

    function_pattern = re.compile(r'^\s*function\b')
    ends_needed = []
    output_lines = []
    inside_function = False
    function_indent = ''

    for idx, line in enumerate(lines):
        # Detect function definition
        if function_pattern.match(line):
            if inside_function:
                # Insert 'end' before new function if previous function wasn't closed
                output_lines.append(f'{function_indent}end\n')
            inside_function = True
            # Capture indentation for the function
            function_indent = re.match(r'^(\s*)', line).group(1)
        output_lines.append(line)

        # Detect explicit 'end'
        if inside_function and re.match(r'^\s*end\s*$', line):
            inside_function = False
            function_indent = ''

    with open(input_path, 'w') as outfile:
        outfile.writelines(output_lines)

    # Remove last "end" if it appears twice
    remove_duplicate_final_end(input_path)

if __name__ == "__main__":
    import sys
    input_path = sys.argv[1]
    fixAceGenMatlabFncCalls(input_path)
    add_end_to_matlab_functions(input_path)

