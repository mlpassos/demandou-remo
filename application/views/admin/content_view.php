<div class="container ajaxload">
	<!-- Apply any bg-* class to to the info-box to color it -->
	<?php 
	if ($this->session->userdata('logado')==true) { ?>
		<div class="row">
			<div class="col-lg-6 text-left">
				<p>Bem vindo, <strong><?php echo $this->session->userdata('nome') . ' ' . $this->session->userdata('sobrenome'); ?></strong></p>
			</div>
			<div class="col-lg-6 text-right">
				<a href="<?php echo base_url(); ?>projeto/adicionar" class="btn btn-primary btn-large" role="button"><span class="glyphicon glyphicon-plus-sign"></span> Adicionar projeto</a>
				<hr>
			</div>
		</div>
	<?php } ?>
</div><!-- /.container -->