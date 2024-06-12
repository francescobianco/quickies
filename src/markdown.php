<?php

use Michelf\MarkdownExtra;

function markdown($text)
{
    return MarkdownExtra::defaultTransform($text);
}
