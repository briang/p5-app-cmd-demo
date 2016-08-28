package App::Kiwi::Command::list;
use App::Kiwi -command;

=head1 NAME

App::Kiwi::Command::list - list thing for kiwi

=head2 VERSION

0.01

=cut

use 5.022;

use strict;  use warnings;  use autodie qw/:all/;
use experimental qw(signatures);

use Data::Dump;
################################################################################
sub execute {
    my ($self, $opt, $args) = @_;

    my $short_long = $opt->{short} ? 'Short' : 'Long';
    say "$short_long listing...";
}

sub description { 'Lists the contents of the KWIC database' }

sub opt_spec {
    return (
        [ 'short|s',  'concise listing', ],
    );
}

1;
