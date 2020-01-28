<?php
$config = require_once '../config/config.php';
require_once '../engine/functions.php';
$uri = parse_url($_SERVER['REQUEST_URI'])['path'];
$path = getPath($uri);
if (!$path || $path == 'catalog') {
    try {
        $dbh = getDbConnection($config);
        $stmt = $dbh->query('SELECT * from catalog');
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $arr = $stmt->fetchAll();
        $tree = buildTree($arr);
        $dbh = null;
        getHeader('Каталог');
        renderCatalog($tree);
        getFooter();
    } catch (PDOException $e) {
        print "Error!: " . $e->getMessage() . "<br/>";
        die();
    }
} else {
    try {
        $dbh = getDbConnection($config);
        $stmt = $dbh->query("SELECT * from catalog WHERE path = '$path' LIMIT 1");
        $item = $stmt->fetch();
        $dbh = null;
        getHeader($item['name']);
        renderItem($item);
        getFooter();
    } catch (PDOException $e) {
        print "Error!: " . $e->getMessage() . "<br/>";
        die();
    }
}