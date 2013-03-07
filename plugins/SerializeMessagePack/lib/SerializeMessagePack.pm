package SerializeMessagePack;

use strict;
use warnings;
use utf8;

use Data::MessagePack;
use MT::Serialize;

{
    no warnings 'redefine';
    *MT::Serialize::new = sub {
        my $class = shift;
        bless { freeze => \&freeze, thaw => \&thaw }, $class;
    };
}

sub freeze {
    my ($ref) = @_;
    'SERG' . pack( 'N', 0 ) . pack( 'N', 0 ) . Data::MessagePack->pack($$ref);
}

sub thaw {
    my ($frozen) = @_;
    return \{} unless $frozen && substr( $frozen, 0, 4 ) eq 'SERG';
    my $mp = Data::MessagePack->new();
    $mp->utf8(1);
    my $obj = $mp->unpack( substr( $frozen, 12 ) );
    \$obj;
}

1;
