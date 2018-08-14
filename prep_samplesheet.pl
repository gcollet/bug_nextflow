#!/usr/bin/env perl

use FindBin qw($Bin);
use lib "$Bin";
use strict;
use warnings;
use Readonly;

our $VERSION = '0.1';

Readonly my $SEP_CHAR => q{,};
Readonly my $TMP_FILE => 'tmp.csv';

my $filename = shift;
print $filename or die "cannot print\n";
# First, write only the lines with relevant informations
open my $fh_in, '<:encoding(UTF-8)', $filename or die "Cannot read file $filename\n";
my $sw = 0;
while ( my $l = <$fh_in> ) {
  if ( $l =~ /^Sample_ID/xms ) { $sw = 1; }
  if ($sw) { print $l or die "Cannot print in $TMP_FILE\n"; }
}
close $fh_in or die "Cannot close file $filename\n";
