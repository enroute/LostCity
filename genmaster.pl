#!/usr/bin/perl -w
use strict;
use warnings;

my $file = shift or die "No file provided in command line.";
local $/;
open my $fh, "<$file" or die $!;
my $contents=<$fh>;
close $fh;

# my @files=map{s/.tex$//;$_} sort glob("src/ch*.tex");
# my $files=join("\n", map{"\\include{$_}"} @files);

# my @match = ($contents=~/\\include{(.*?)}/);

$contents=~s/%<<T_FILES>>\\include\{(.*?)\}<<\/T_FILES>>\K/list_files($1)/exg;
print $contents;


sub list_files{
  my ($pattern)=@_;
  my @files = glob($pattern);
  return "\n" . join("\n", map{s/.tex$//;"\\include{$_}"} @files);
}
