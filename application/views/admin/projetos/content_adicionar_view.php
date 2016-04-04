<div class="container ajaxload">
	<?php if ($this->session->userdata('logado')==true) { ?>
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<?php echo form_open('projeto/adicionar', ["id" => "frmProjeto-Adicionar", "class" => "projeto-adicionar", "role" => "form"]); ?>
			  <div class="form-group">
			    <label for="titulo">Título</label>
			    <?php echo form_error('titulo'); ?>
			    <input type="text" class="form-control" id="titulo" name="titulo" value="<?php echo set_value('titulo'); ?>" placeholder="Título">
			  </div>
			  <div class="form-group">
			    <label for="descricao">Descrição</label>
			    <?php 
			    echo form_error('descricao'); 
			    if (isset($_POST['descricao'])) {
	        	$value = $_POST['descricao'];
	       	} else {
	          $value = '';
	        }
					$props = array(
						"class" => "form-control",
						"id" => "descricao",
						"name" => "descricao",
						"value" => $value,
						"placeholder" => "descricao",
						"rows" => "3"
					);
				    echo form_textarea($props);
			    ?>
			  </div>
		</div>
		<div class="col-lg-12 col-md-12">
			<div class="form-group">
				<label class="radio-inline">
				  <input type="radio" name="prioridade" id="prioridade1" value="3"> <span class="prioridades-radio bg-danger">ALTA</span>
				</label>
				<label class="radio-inline">
				  <input type="radio" name="prioridade" id="prioridade2" value="2"> <span class="prioridades-radio bg-warning">MÉDIA</span>
				</label>
				<label class="radio-inline">
				  <input type="radio" name="prioridade" id="prioridade3" value="1"> <span class="prioridades-radio bg-success">BAIXA</span>
				</label>
			</div>
		</div>
		<div class="col-lg-6 col-md-6">
			  <div class="form-group">
			    <label for="data_nascimento">Início</label>
			    <?php echo form_error('data_inicio'); ?>
			    <input type="date" class="form-control" id="data_inicio" name="data_inicio" placeholder="Nome">
			  </div>
		</div>
		<div class="col-lg-6 col-md-6">
			  <div class="form-group">
			    <label for="data_nascimento">Prazo</label>
			    <?php echo form_error('data_prazo'); ?>
			    <input type="date" class="form-control" id="data_prazo" name="data_prazo" placeholder="Nome">
			  </div>
		</div>
		<div class="col-lg-12 col-md-12">
			<hr>
		</div>
		
		<div class="col-lg-6 col-md-6">
			  <div class="form-group">
			    <label for="lider">Origem</label>
			    <?php echo form_error('lider'); ?>
			    <!-- <input type="text" class="form-control" id="lider" name="lider" placeholder="Líder do projeto..."> -->
			    <select id="lider" name="lider" multiple="multiple" class="form-control">
				  <?php 
				    // var_dump($usuarios);
				  	foreach($setores as $s) {
			  			echo "<option value='" . $s['codigo'] . "'>" . $s['nome'] . "</option>";
				  	}
				  ?>
				</select>
				<p class="lider-box">
					* Líder já é um participante
				</p>
			  </div>
		</div>
		<div class="col-lg-6 col-md-6">
			  <div class="form-group">
			    <label for="participantes">Áreas Participantes</label>
			    <?php echo form_error('participantes'); ?>
			    <select id="participantes" name="participantes[]" multiple="multiple" class="form-control">
				  <?php 
				    // var_dump($usuarios);
				  	foreach($setores as $s) {
				  		// exclui neto dos participantes do projeto, pois ele já é lider e participa
				  		if ($u['codigo']!==6) {
				  			echo "<option value='" . $s['codigo'] . "'>" . $s['nome'] . "</option>";	
				  		}
				  	}
				  ?>
				</select>
			    <!-- <input type="text" class="form-control" id="participantes" name="participantes" placeholder="Nome"> -->
			  </div>
		</div>
		<div class="col-lg-12 col-md-12">
			<button type="submit" class="btn btn-default">Gravar</button>
		</div>

			<?php echo form_close(); ?>
	</div>
</div><!-- /.container -->
<?php } ?>
