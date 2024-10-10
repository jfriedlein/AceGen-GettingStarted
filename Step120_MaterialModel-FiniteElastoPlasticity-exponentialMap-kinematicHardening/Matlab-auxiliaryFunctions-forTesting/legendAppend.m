function legendAppend(legendEntry)
     % Retrieve current legend text, where the last plotted curve is
    % still unnamed
     Legend_handle = legend();
    % Replace the last entry in the string argument by the desired legend text
    i_entry = max(1, length(Legend_handle.String) );
     Legend_handle.String{i_entry} = legendEntry;
    % Don't interpret the legend entries as LaTeX
     set(Legend_handle, 'Interpreter', 'none')
end

