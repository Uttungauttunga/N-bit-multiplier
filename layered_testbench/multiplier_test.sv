program multiplier_test(multiplier_intf intf);
multiplier_env env;
initial begin
env = new(intf);
env.gen.repeat_count = 100;
env.run();
end
endprogram
