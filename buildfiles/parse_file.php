<?php
try {
    $file = $argv[1];
    if (!file_exists($file)) {
        throw new \Exception("Unable to source file");
    }
    $rows = explode("\n", file_get_contents($file));
    $result = array_filter($rows, function($item) {
        $items = explode("\t", $item);
        if (is_array($items) && count($items) >2 && $items[3]) {
            if (strlen($items[3])>4) {
                return $items;
            }
        }
    });
    $fp = fopen("/osm/output/".$file, "w");
    fputs($fp, implode("\n", $result));
    fclose($fp);
} catch (\Exception $exception) {
    print "Error: " . $exception->getMessage();
}
