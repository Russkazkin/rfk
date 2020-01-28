<li>
    <a href="<?= $item['baseUrl'] . '/' . $item['path']; ?>/"><?= $item['name']; ?></a>

    <?php if(isset($item['children'])): ?>
    <ul>
        <?= renderTree($item['children']); ?>
    </ul>
    <?php endif;?>
</li>
