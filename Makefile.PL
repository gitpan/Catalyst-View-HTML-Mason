
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'HTML::Mason rendering for Catalyst',
  'AUTHOR' => 'Florian Ragwitz <rafl@debian.org>, Sebastian Willert <willert@cpan.org>, Robert Buels <rbuels@cpan.org>',
  'BUILD_REQUIRES' => {
    'Capture::Tiny' => '0.10',
    'Catalyst' => '0',
    'Catalyst::Action::RenderView' => '0',
    'Catalyst::Controller' => '0',
    'Catalyst::Helper' => '1.33',
    'Catalyst::Test' => '0',
    'File::Temp' => '0',
    'FindBin' => '0',
    'Path::Class' => '0',
    'Test::Exception' => '0',
    'Test::More' => '0.89',
    'utf8' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'Catalyst-View-HTML-Mason',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Catalyst::View::HTML::Mason',
  'PREREQ_PM' => {
    'Catalyst::Runtime' => '5.80',
    'Catalyst::View' => '0',
    'Data::Visitor::Callback' => '0',
    'Encode::Encoding' => '0',
    'HTML::Mason' => '0',
    'Moose' => '0',
    'Moose::Util::TypeConstraints' => '0',
    'MooseX::Types::Moose' => '0',
    'MooseX::Types::Structured' => '0',
    'Try::Tiny' => '0',
    'namespace::autoclean' => '0'
  },
  'VERSION' => '0.18',
  'test' => {
    'TESTS' => 't/*.t'
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



