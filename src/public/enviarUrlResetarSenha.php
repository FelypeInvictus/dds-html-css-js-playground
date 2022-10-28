<?php

require __DIR__ . '/../../vendor/autoload.php';

$request = $_REQUEST('email');
$base64 = base64_encode('email=$request');
$url = "alterarSenha.php:9000/$base54";
$response = json_encode([
    'sucess' => false,
    'data' => [],
    'message' => 'Nenhuma resposta obtida pelo servidor.'
]);

$mail = new PHPMailer();

try {
    $phpmailer = new PHPMailer();
    $phpmailer->isSMTP();
    $phpmailer->Host = 'smtp.mailtrap.io';
    $phpmailer->SMTPAuth = true;
    $phpmailer->Port = 2525;
    $phpmailer->Username = 'db98ef3a51db59';
    $phpmailer->Password = '0e4464cc8bf339';

    $phpmailer->setFrom('felype.sales@es.estudante.senai.br', 'Felype');
    $phpmailer->addAddres('felype.sales@es.estudante.senai.br', 'Invictus Corp');
    
    $phpmailer->isHTML(true);
    $phpmailer->Subject = 'Resetar a senha';
    $phpmailer->Body = 'Clique no link abaixo para enviar solicitação de alteração de senha';
    $phpmailer->Body = '$url';
    $phpmailer->AltBody = 'Clique no link abaixo para enviar solicitação de alteração de senha';

    $email->send();


    $response = json_encode([
        'sucess' => true,
        'data' => [],
        'message' => 'Link para recuperação de senha enviado com sucesso para o email informado'
    ]);

} catch (Exception $e) {
    $response = json_encode([
        'sucess' => true,
        'data' => [],
        'message' => 'Não foi possivel enviar o email: <br /> {$mail->ErrorInfo}'
    ]);
}

echo $response;








