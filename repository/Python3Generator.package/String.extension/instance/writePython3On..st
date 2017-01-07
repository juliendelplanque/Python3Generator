*Python3Generator
writePython3On: aStream
	aStream
		<< $';
		<< (((self splitOn: '\') joinUsing: '\\') lines joinUsing: '\n');
		<< $'