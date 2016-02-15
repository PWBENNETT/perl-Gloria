package App::Gloria;

use 5.020;
use utf8;

sub new { ... }

sub parse_string { ... }

1;

__END__

=head1 NAME

App::Gloria - The engine for the C<gloria> data-parsing tool

=head1 SYNOPSIS

    use Carp;
    use DBI;
    use IO::All;
    ...
    my $dbh = DBI->connect($dsn, $user, $pass);
    my $configs = io->catdir($ENV{ HOME }, '.gloria.d')->filter(sub { $_->filename =~ /\.yml$/ })->sort(1);
    sub table_exists {
        carp $_[0]->{ Driver }->{ Name } . " table $_[1] already exists. Going to add to it";
        return 1;
    };
    my $gloria = App::Gloria->new(dbh => $dbh, configs => $configs, table_exists => \&table_exists);
    $gloria->parse_string(qx{ps -efl});
    my $sth = $dbh->prepare( ... );
    $sth->execute();
    ...

=head1 DESCRIPTION

Provides the engine for the "Grep-Like Object Resembling Information Awareness" tool platform.
