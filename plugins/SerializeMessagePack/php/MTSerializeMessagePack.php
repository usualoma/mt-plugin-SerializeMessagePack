<?php

class MTSerializeMessagePack {
    function serialize($data) {
        return 'SERG' . pack('N', 0) . pack('N', 0) . msgpack_serialize($data);
    }

    function unserialize($data) {
        return msgpack_unserialize(substr($data, 12));
    }
}
