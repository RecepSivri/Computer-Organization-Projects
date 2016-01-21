module demo_main();
	
	
	wire [9:0]led;
	reg [9:0]sw;
	main  demo(led,sw);
	
	initial begin
		$monitor(
	"%b%b%b%b - %b%b%b%b=%b%b%b%b",sw[3],sw[2],sw[1],sw[0],sw[7],sw[6],sw[5],sw[4],led[3],led[2],led[1],led[0]); 
	sw[3]=0;sw[2]=1;sw[1]=1;sw[0]=0;
	sw[7]=1;sw[6]=1;sw[5]=1;sw[4]=0;
	sw[9]=0;sw[8]=0;
	
	end
endmodule