
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "DAIA Server as Plack application",
  "AUTHOR" => "Jakob Voss",
  "BUILD_REQUIRES" => {
    "Test::Builder::Tester" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Plack-App-DAIA",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Plack::App::DAIA",
  "PREREQ_PM" => {
    "CGI" => 0,
    "Carp" => 0,
    "DAIA" => "0.4",
    "Encode" => 0,
    "HTTP::Request::Common" => 0,
    "JSON" => 0,
    "LWP::Simple" => 0,
    "Plack::Component" => 0,
    "Plack::Request" => 0,
    "Plack::Test" => 0,
    "Plack::Util::Accessor" => 0,
    "Scalar::Util" => 0,
    "Test::Builder::Module" => 0,
    "Test::JSON::Entails" => 0,
    "Test::More" => 0,
    "URI::Escape" => 0,
    "XML::LibXML" => 0,
    "base" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.42",
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



