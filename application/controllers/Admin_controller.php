<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin_controller extends MY_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */

	public function __construct() {
        parent::__construct();
        if ((int) $this->session->userdata('codigo_perfil')!==2) {
        	redirect(base_url());
        }
    }

	public function index()	{
		// META
		$data_header['meta']=array(
			array(
			"name" => "title",
			"content" => "Página do Administrador"
			),
			array(
			"name" => "description",
			"content" => "Página do Administrador"
			),
			array(
			"name" => "keywords",
			"content" => "admin,demandou,demandas, html5, sistema"
			)
		);
		// MENU
		$data_header['menu']=array(
			array(
				"name" => "Projetos",
				"link" => base_url() . 'projetos',
				"class" => ""
				)
		);
		// CSS
		$data_header['css']=array(
			array('file' => 'estilos-principal.css'),
			array('file' => 'estilos-admin.css')
			); 
		// JS
		$data_footer['js']=array(
			// array('file' => 'http://cdnjs.cloudflare.com/ajax/libs/masonry/3.3.2/masonry.pkgd.min.js'), 
			// array('file' => 'http://js.pusher.com/3.0/pusher.min.js'),
			array('file' =>  base_url() . 'assets/js/global.js'),
			array('file' =>  base_url() . 'assets/js/admin.js')
		);

		$this->load->view('header_view',$data_header);
		$this->load->view('admin/content_view');
		$this->load->view('footer_view',$data_footer);		
	}

}
