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
    'SERG' . Data::MessagePack->pack($$ref);
}

sub thaw {
    my ($frozen) = @_;
    return \{} unless $frozen && substr( $frozen, 0, 4 ) eq 'SERG';
    my $obj = Data::MessagePack->unpack( substr( $frozen, 4 ) );
    \$obj;
}

1;
