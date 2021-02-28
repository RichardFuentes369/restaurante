<?php

namespace App\Http\Controllers;

use BotMan\BotMan\BotMan;
use Illuminate\Http\Request;
use BotMan\BotMan\Messages\Incoming\Answer;

class BotManController extends Controller
{
/**
     * Place your BotMan logic here.
     */
    public function handle(Request $request)
    {
        $botman = app('botman');

        // $botman->hears('{message}', function($botman, $message) {
        //     if ($message == 'hi') {
        //         $this->askName($botman);
        //     }else{
        //         $botman->reply("write 'hi' for testing...");
        //     }

        // });

            $botman->hears('Hola', function ($bot) {
                $bot->reply('Bienvenido al restau!');
            });

                        $botman->hears('Ayuda', function ($bot) {
                $bot->reply('En que te podemos colaborar');
            });

        $botman->listen();
    }

    /**
     * Place your BotMan logic here.
     */
    public function askName($botman)
    {
        $botman->ask('Hello! What is your Name?', function(Answer $answer) {

            $name = $answer->getText();

            $this->say('Nice to meet you '.$name);
        });
    }
}

