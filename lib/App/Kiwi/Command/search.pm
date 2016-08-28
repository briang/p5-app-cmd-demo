package App::Kiwi::Command::search;
use App::Kiwi -command;

=head1 NAME

App::Kiwi::Command::search - implement searching for kiwi

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

    my $case = $opt->{ignore} ? 'IgNoRiNg CaSe' : 'CASE is IMPORTANT';
    say "Searching ($case)...";
}

sub description { 'Search the KWIC database' }

sub opt_spec {
    return (
        [ 'ignore|i',  'ignore case when searching', ],
    );
}

1;
