<div class="container ajaxload">
	<?php if ($this->session->userdata('logado')==true) { ?>
		<div class="row">
			<!-- <div class="col-lg-4"></div> -->
			<div class="col-lg-12 col-md-12">
				<?php
					foreach($projeto as $p) {
						echo $p['titulo'];
					}
				?>
			</div>
		</div>
	<?php } ?>
</div><!-- /.container -->