<?php

function hook_note_before_save($args)
{
    $args[1] = strtoupper($args[1]);

    return $args;
}


