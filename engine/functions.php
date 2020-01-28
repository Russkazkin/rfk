<?php

function getPath(string $uri) : string {
    $query_arr = array_filter(explode('/', $uri), function($element) {
        return !empty($element);
    });
    $path = end($query_arr);
    return strval(strip_tags($path));
}

function getDbConnection(array $config){
    return new PDO('mysql:host=mariadb;dbname=rfk;charset=utf8;', $config['db_user'], $config['db_password']);
}

function buildTree($arr){
    $tree = [];
    $data = [];
    foreach ($arr as $item) {
        $data[$item['id']] = $item;
    }
    foreach($data as $id => &$row){
        if($row['parent'] == 0){
            $tree[$id] = &$row;
        } else {
            $row['baseUrl'] = $data[$row['parent']]['baseUrl'] . '/' . $data[$row['parent']]['path'];
            $data[$row['parent']]['children'][$id] = &$row;
        }
    }
    /*echo '<pre>';
    print_r($tree);
    echo '</pre>';*/

    return $tree;
}

function getHeader($title = 'Заголовок') { ?>
    <!DOCTYPE html>
    <html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title><?= $title ?></title>
</head>
<?php }
function getFooter() { ?>
    </body>
    </html>
<?php }

function renderCatalog($tree){ ?>
    <div class="container">
        <h1>Каталог</h1>
        <?= renderTree($tree) ?>
    </div>
<?php }

function renderTree($items)
{
    $result = '';
    foreach ($items as $item) {
    ob_start();
    include '../templates/treeItem.php';
    $result .= ob_get_clean();
    }
    return $result;
 }
function renderItem($item) { ?>
    <div class="container">
        <h1><?= $item['name']?></h1>
        <p><?= $item['descr']?></p>
    </div>
<?php }