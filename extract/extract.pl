#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper qw(Dumper);

my %count;
my $total_lines = 0;
my $file = shift or die "Usage: $0 FILE\n";
open my $fh, '<', $file or die "Could not open '$file' $!";
my $isPrintAl = 0;
my $isPrintTf = 0;
my $isPrintMg = 0;
my $isPrintDc = 0;
my $isPrintPh = 0;
my $i=1;

my @vetAl;
my @vetTf;
my @vetMg;
my @vetDc;
my @vetPh;
while (my $line = <$fh>) {
    chomp $line;
    foreach my $str (split /\s+\n/, $line) {
        $count{$str}++;
        my @seqs = split ' ', $str;
        $isPrintAl = 0;
		$isPrintTf = 0;
		$isPrintMg = 0;
		$isPrintDc = 0;
		$isPrintPh = 0;
		$i=$i+1;
        foreach my $n (@seqs) {
  			if( $isPrintAl==0 && $n =~ /(TR.*Ac)/){
  				$isPrintAl = !$isPrintAl;
  				push @vetAl, $n;

  			}
  			if( $isPrintTf==0 && $n =~ /(TR.*Tf)/){
  				$isPrintTf = !$isPrintTf;
  				push @vetTf, $n;
  			}
  			if( $isPrintMg==0 && $n =~ /(TR.*Mg)/){
  				$isPrintMg = !$isPrintMg;
  				push @vetMg, $n;
  			}
  			if( $isPrintDc==0 && $n =~ /(TR.*Dc)/){
  				$isPrintDc = !$isPrintDc;
  				push @vetDc, $n;
  			}
  			if( $isPrintPh==0 && $n =~ /(TR.*Ph)/){
  				$isPrintPh = !$isPrintPh;
  				push @vetPh, $n;
  			}
		}
    }
}

my $index=0;
my $isSameSize = $#vetAl==$#vetTf && $#vetMg && $#vetDc == $#vetPh;

for($index=0; $index<=$#vetAl && $isSameSize; $index++){
     print $vetAl[$index], "\t", $vetTf[$index], "\t", $vetMg[$index], "\t", $vetDc[$index], "\t", $vetPh[$index],  "\n";
}

