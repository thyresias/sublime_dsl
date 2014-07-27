# encoding: utf-8

snippets do

  default_scope 'source.processing'
  file_format :textmate

  tab 'float', 'float', <<-'TXT', uuid: '8CA89D0B-7B33-45C1-971C-F197D3C6A693', file: 'float (float)'
float $1 = $2;
TXT

  tab 'float[]', 'float[]', <<-'TXT', uuid: '9B78606A-BEAB-4234-8DD1-E52C25FC2836', file: 'float[] (float[])'
float[] $1 = new float[$2];
TXT

  tab 'gl', 'opengl', <<-'TXT', uuid: '49F7D289-0893-4F93-9AFF-39A5CF3E1CE6', file: 'opengl (gl)'
import processing.opengl.*;
TXT

  tab 'int', 'int', <<-'TXT', uuid: '5EBF77EA-9E6C-43CB-9B22-159C70735DA6', file: 'int (int)'
int $1 = $2;
TXT

  tab 'int[]', 'int[]', <<-'TXT', uuid: '1D075382-1F2C-47B0-8A48-1906480D6239', file: 'int[] (int[])'
int[] $1 = new int[$2];
TXT

  tab 'se', 'draw', <<-'TXT', uuid: '78A35FDC-F40B-48AC-93D2-97D303A51FF4', file: 'draw (se)'
void draw() {
	$1
}
TXT

  tab 'se', 'setup', <<-'TXT', uuid: '1D2C24EC-3F88-4FA7-B419-8356046F19FA', file: 'setup (se)'
void setup() {
	$1
}
TXT

  tab 'size', 'size', <<-'TXT', uuid: 'B66B064F-4B0C-4674-86E8-F8ABF29272D3', file: 'size (size)'
size($1, $2, ${3:P3D});
TXT

  tab 'str', 'string', <<-'TXT', uuid: '4410834F-F43B-4BE9-BC3C-B05CB8E13382', file: 'string (str)'
string $1 = $2;
TXT

  tab 'string[]', 'string[]', <<-'TXT', uuid: '2D3DBFE5-4075-4189-B00C-2BF4090802B1', file: 'string[] (string[])'
string[] $1 = new string[$2];
TXT

  tab 'void', 'void method', <<-'TXT', uuid: '5974F040-26BB-41DC-B943-8A9560074B04', file: 'void method (void)'
void $1($2 $3) {
	$4
}
TXT

end