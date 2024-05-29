clear,clc;
close all;

xInput=1;

[y1Output,Dy1DxOutput,y2Output,Dy2DxOutput,y3Output,Dy3DxOutput,y4Output,Dy4DxOutput] = IfConditions_Nested(xInput);

disp("results y1 ... y4:")
[y1Output,y2Output,y3Output,y4Output]

disp("results y1 ... y4:")
[Dy1DxOutput,Dy2DxOutput,Dy3DxOutput,Dy4DxOutput]

x_vector = linspace(-20,10,1000);

for i=1:length(x_vector)
    [y1Output(i),Dy1DxOutput(i),y2Output(i),Dy2DxOutput(i),y3Output(i),Dy3DxOutput(i),y4Output(i),Dy4DxOutput(i)] = IfConditions_Nested(x_vector(i));
end

plot(x_vector,y1Output,'-')
hold on
plot(x_vector,y2Output,'--')
plot(x_vector,y3Output,':')
plot(x_vector,y4Output,'-.')