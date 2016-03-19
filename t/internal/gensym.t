#!/usr/bin/perl

use strict;
use warnings;

use Devel::Cover::Inc;
use Devel::Cover::Test;
use Test::More tests => 1;

# bug fixed with 5.22
$ENV{DEVEL_COVER_SELF} = 1;
my $test = Devel::Cover::Test->new("gensym");
$test->{debug} = 1;
$test->{test_parameters} .= '-inc . +select main';
my $cmd = $test->test_command;
my $result = `$cmd 2>&1`;
if ($result =~ /Bizarre copy of/m) {
  ok 0, $result;
} else {
  ok 1, "gensym";
}
