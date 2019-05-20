<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title><?php echo $head_title; ?></title>
</head>

<body>
  <header>
  </header>

  <?php echo $content; ?>

  <footer>
  </footer>
<script>
  var VIEW_SETTINGS = <?php echo json_encode($this->config->item('VIEW_SETTINGS'));?>;
</script>
<!-- script -->
<?php if (isset($script)) { echo $script; } ?>

</body>
</html>
