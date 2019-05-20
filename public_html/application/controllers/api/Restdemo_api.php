<?php
require APPPATH . '/libraries/REST_Controller.php';
require APPPATH . '/libraries/Format.php';
use Restserver\Libraries\REST_Controller;

class Restdemo_api extends REST_Controller {

    public function __construct() {
        parent::__construct();
        $this->output->set_content_type('application/json', 'utf-8');
    }

    public function hello_post() {
        $response_data = [
            'status' => 'ok',
            'id' => '1001',
            'message' => 'Hello! This messaage is Ajax Response'
        ];

        $this->output->set_output(json_encode($response_data));
        return;
    }
}
