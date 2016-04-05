<div id="ajaxload" class="container-fluid ajaxload">
<?php if ($this->session->userdata('logado')==true) { ?>
		<div class="row">
			<div class="col-lg-12 text-right">
				<a href="<?php echo base_url(); ?>projeto/adicionar" class="btn btn-primary btn-large" role="button"><span class="glyphicon glyphicon-plus-sign"></span> Adicionar projeto</a>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 filtro">
				<div class="btn-group" role="group" aria-label="...">
				  <button type="button" class="btn btn-default filter filter-all" data-filter-by="*">
				  	<!-- <i class="fa fa-sort"></i> -->
				  	Mostrar todos
				  </button>
				  <button type="button" class="btn btn-default sort" data-sort-by="prioridade" data-order-by="true">
				  	<i class="fa fa-sort-asc"></i>
				  	Prioridade
				  </button>
				  <button type="button" class="btn btn-default sort" data-sort-by="titulo" data-order-by="true">
				  	<i class="fa fa-sort-asc"></i>
				  	Titulo
				  </button>
				  <button type="button" class="btn btn-default sort" data-sort-by="total_tarefas" data-order-by="true">
				  	<i class="fa fa-sort-asc"></i>
				  	Total de tarefas
				  </button>
				  <button type="button" class="btn btn-default sort" data-sort-by="data_prazo" data-order-by="true">
				  	<i class="fa fa-sort-asc"></i>
				  	Prazo
				  </button>
				</div>
				<div class="input-group input-procurar">
				  <span class="input-group-addon" id="procurar-addon"><i class="fa fa-search"></i></span>
				  <input type="text" id="search-term" class="form-control" placeholder="Procurar em <?php echo sizeof($projetos);?> projetos..." aria-describedby="procurar-addon">
				</div>
				<hr>
			</div>
		</div>
<div class="row tarefas-grid">
	<?php 
	
	foreach($projetos as $p) { 
?>
		<div class="cor-coluna col-lg-2 col-md-3 col-sm-4 col-xs-12">
				<?php 
					switch ($p['prioridade']) {
		        		case '3':
		        			$prioridadesClass = 'prioridade-alta';
		        			break;
		        		case '2':
		        			$prioridadesClass = 'prioridade-media';
		        			break;
		        		case '1':
		        			$prioridadesClass = 'prioridade-baixa';
		        			break;
		        		default:
		        			$prioridadesClass = 'bg-info';
		        			break;
		        	}
				?>
				<div class="tarefas-box hvr-curl-bottom-right projeto-<?php echo $p['codigo_projeto']; ?>">
					<!-- <i class="pin animated fadeInDownBig"></i> -->
					<!-- tarefas -->
					<div class="caption">
						<header class="tarefas-box-header <?php echo $prioridadesClass; ?>">
				        <span style="display:none;" class="tarefa-prioridade"><?php echo $p['prioridade']; ?></span>
				        <h3 class="tarefa-titulo">
				        	<a href="projeto/ver/<?php echo $p['codigo_projeto']; ?>" class="link-projeto"><?php echo $p['titulo'];?></a></h3>
				       </header>
				        <!-- <div class="clearfix"></div> -->
				        <!-- FOOTER  -->
		        	<div class="tarefas-acoes btn-group btn-group-xs" role="group" aria-label="...">
				    		<a href="#" class="btn btn-sm" role="button" data-codigoprojeto="<?php echo $p['codigo_projeto'];?>" data-prioridade="<?php echo $p['prioridade']; ?>" data-prazo="<?php echo $p['data_prazo']; ?>" data-inicio="<?php echo $p['data_inicio']; ?>" data-descricao='<?php echo $p['descricao']; ?>' data-titulo="<?php echo $p['titulo']; ?>" data-toggle="modal" data-target="#myModalProjetoVer">
		  						<span data-toggle="tooltip" data-placement="top" title="Ver"  class="projetos-acoes-btn fa fa-eye" aria-hidden="true"></span>
				    		</a> 
				    		<?php 
				    			$data_lider = array('codigo_projeto'=>$p['codigo_projeto']);
								  $this->session->set_userdata('gerenciar_projeto-' . $p['codigo_projeto'], $data_lider);
				    		?>
				    			<a href="<?php echo base_url() . 'projeto/alterar/' . $p['codigo_projeto'];?>" class="btn btn-sm" role="button">
			  						<span data-toggle="tooltip" data-placement="top" title="Alterar"  class="projetos-acoes-btn fa fa-pencil" aria-hidden="true"></span>
					    		</a>
			    			<?php 
					    			$data = array('codigo_projeto'=>$p['codigo_projeto']);
									  $this->session->set_userdata('gerenciar_tarefas-' . $p['codigo_projeto'],$data);
					    		?>
				    			<a href="<?php echo base_url() . 'tarefa/adicionar/' . $p['codigo_projeto'];?>" id="tarefasGerenciar" class="btn btn-sm" role="button" data-codigoprojeto="<?php echo $p['codigo_projeto'];?>">
		  							<span data-toggle="tooltip" data-placement="top" title="Gerenciar tarefas"  class="projetos-acoes-btn fa fa-tasks" aria-hidden="true"></span>
				    			</a>	
				    		<a href="#" class="btn btn-sm" role="button" data-codigousuario="<?php echo $this->session->userdata('codigo_usuario'); ?>" data-codigoprojeto="<?php echo $p['codigo_projeto'];?>" data-prioridade="<?php echo $p['prioridade']; ?>" data-prazo="<?php echo $p['data_prazo']; ?>" data-inicio="<?php echo $p['data_inicio']; ?>" data-descricao='<?php echo $p['descricao']; ?>' data-titulo="<?php echo $p['titulo']; ?>" data-toggle="modal" data-target="#myModalTarefaVer">
		  						<span data-toggle="tooltip" data-placement="top" title="Total de mensagens/posts no projeto" class="tarefa-stats total_tarefas badge">99</span>
			    			</a>
			    			
			    		</div> 
	        	<div class="body tarefas-box-descricao">
		        	<?php 
		        	$this->load->helper('text');
		        	echo word_limiter($p['descricao'],20);
		        	?> 
							<p class="tarefas-box-datas">
				        <?php 
				        	$this->load->helper('date');
						   		// PRAZO
						   		$timestamp = strtotime($p['data_prazo']);
						   		?>
									<span style="display:none;" class="data_prazo"><?php echo $p['data_prazo']; ?></span>
						   		<?php
									$now = time();
									if( strtotime($p['data_prazo']) < strtotime('now') ) {
										$str = strtotime('now') - strtotime($p['data_prazo']);
										$dif = ceil($str/3600/24);
										if ($dif>1) {
											echo '<br><span class="fa fa-exclamation-circle"></span> Atrasado ' . $dif . ' dias';	
										} else {
											echo '<br><span class="fa fa-exclamation-circle"></span> Atrasado ' . $dif . ' dia';	
										}
										
									} else {
										echo "<br><span class='fa fa-calendar'></span> ";
										echo timespan($now, $timestamp);
									}
				        ?> 
			        </p>
			        <ul class="participantes-lista">
								<li>Origem</li>
								<li>Destinos</li>
		        	</ul>
			    	</div>
	    		</div>
		    	<div class="projeto-trash">
		    		<a data-toggle="modal" data-target="#myModalConfirmar" data-tipo="excluir" data-texto="Você tem certeza que deseja excluir o projeto" data-titulo="<?php echo $p['titulo']; ?>" href="#" class="projeto-excluir" data-codigoprojeto="<?php echo $p['codigo_projeto']; ?>">
		    			<i class="fa fa-trash-o pull-right hvr-icon-trash-o" data-toggle="tooltip" data-placement="top" title="Excluir"></i>
		    		</a>
		    	</div>
				</div>
		</div>
	<?php }; ?>
</div>
<!-- Modal -->
<div class="modal-container">
	<div class="modal fade" id="myModalConfirmar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Aviso</h4>
	      </div>
	      <div class="modal-body">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default confirma-sim" data-dismiss="modal" data-codigoprojeto="" data-tipo="" data-elemento="">Sim</button>
	        <button type="button" class="btn btn-default confirma-nao" data-dismiss="modal">Não</button>
	      </div>
	    </div>
	  </div>
	</div>
	<div class="modal fade" id="myModalProjetoVer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Modal Ver</h4>
	      </div>
	      <div class="modal-body">
	        <p class="descricao"></p>
	        <p class="data-inicio"></p>
	        <p class="data-prazo"></p>
	        <p class="data-faltam alert alert-info"></p>
	        Tempo consumido (%)
	        <div class="progress">
			  <div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em;">
			    
			  </div>
			</div>
			
			<!-- <div class="modal-tarefas-timeline"> -->
				
			<!-- </div> -->
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
	      </div>
	    </div>
	  </div>
	</div>
</div>
<?php } ?>
</div><!-- /.container -->