<div class="container-fluid ajaxload">
	<!-- Apply any bg-* class to to the info-box to color it -->
	<?php 
	if ($this->session->userdata('logado')==true) { ?>
		<p>Bem vindo, <strong><?php echo $this->session->userdata('nome') . ' ' . $this->session->userdata('sobrenome'); ?></strong></p>
	<?php } ?>
</div><!-- /.container -->