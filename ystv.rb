ystvlib = library "ystv" do
	tape "ystv01"
	tape "ystv02"
	tape "ystv03"
	tape "ystv04"
	tape "ystv05"
	tape "ystv06"
	tape "ystv07"
	tape "ystv08"
	tape "ystv09"
	tape "ystv10"
end

urylib = library "ury" do
	tape "ury001", :slot => 11
	tape "ury002", :slot => 12
	tape "ury003", :slot => 13
	tape "ury004", :slot => 14
	tape "ury005", :slot => 15
	tape "ury006", :slot => 16
	tape "ury007", :slot => 17
	tape "ury008", :slot => 18
	tape "ury009", :slot => 19
	tape "ury010", :slot => 20
end

tapebackup = robot "tapebackup" do
	uselibrary "ystv", ystvlib
	uselibrary "ury", urylib
end
