<?php

class MTSerializeMessagePack {
    function serialize($data) {
        return 'SERG' . msgpack_serialize($data);
    }

    function unserialize($data) {
        return msgpack_unserialize(substr($data, 4));
    }
}
