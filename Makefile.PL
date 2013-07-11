
use strict;
use warnings;

use 5.010001;

use ExtUtils::MakeMaker 6.30;

use File::ShareDir::Install;
install_share dist => "share";


my %WriteMakefileArgs = (
  "ABSTRACT" => "DAIA Server as Plack application",
  "AUTHOR" => "Jakob Voss",
  "BUILD_REQUIRES" => {
    "Test::Builder::Tester" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "File::ShareDir::Install" => "0.03"
  },
  "DISTNAME" => "Plack-App-DAIA",
  "EXE_FILES" => [
    "bin/provedaia"
  ],
  "LICENSE" => "perl",
  "NAME" => "Plack::App::DAIA",
  "PREREQ_PM" => {
    "CGI" => 0,
    "Carp" => 0,
    "DAIA" => "0.41",
    "Encode" => 0,
    "File::ShareDir" => 0,
    "File::Spec::Functions" => 0,
    "Getopt::Long" => 0,
    "HTTP::Request::Common" => 0,
    "JSON" => 0,
    "LWP::Simple" => 0,
    "Plack::Component" => 0,
    "Plack::Middleware::Static" => 0,
    "Plack::Request" => 0,
    "Plack::Test" => 0,
    "Plack::Util::Accessor" => 0,
    "Pod::Usage" => 0,
    "Scalar::Util" => 0,
    "Test::Builder::Module" => 0,
    "Test::JSON::Entails" => 0,
    "Test::More" => 0,
    "Try::Tiny" => 0,
    "URI::Escape" => 0,
    "base" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.50",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);

{
package
MY;
use File::ShareDir::Install qw(postamble);
}


