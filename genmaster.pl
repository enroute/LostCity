#!/usr/bin/perl -w
use strict;
use warnings;

my $file = shift or die "No file provided in command line.";
local $/;
open my $fh, "<$file" or die $!;
my $contents=<$fh>;
close $fh;

my @files=map{s/.tex$//;$_} sort glob("ch*.tex");
my $files=join("\n", map{"\\include{$_}"} @files);
$contents=~s/%<<T_FILES>>\\include\{T_FILE\}<<\/T_FILES>>\K/\n$files/x;
print $contents;

