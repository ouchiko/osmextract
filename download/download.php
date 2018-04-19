<?php
$content = json_decode(file_get_contents("downloads.json"));
$item = $argv[1];
$destination = "../osm/";

if (!$argv[1]) {
    print "No ID provided";
}
