<?php defined('BASEPATH') OR exit('No direct script access allowed');
class Restdemo extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {

        $view_data = [

        ];

        $data = [
            'head_title'      => "Rest demo page",
            'content'         => $this->load->view('restdemo/restdemopage', $view_data, true),
            'script'          => $this->load->view('restdemo/restdemopage_script', $view_data, true),
        ];

        $this->load->view('template', $data);
    }
}
