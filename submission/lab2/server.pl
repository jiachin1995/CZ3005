:- debug.
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_files)).
:- use_module(library(http/http_client)).
:- use_module(library(http/http_error)).
:- use_module(library(http/http_parameters)).

?-['main.pl'].


%% rule for static files handler
:- multifile http:location/3.
:- dynamic   http:location/3.
http:location(files, '/web', []).
:- http_handler(files(.), http_reply_from_files('web', []), [prefix]).

%% rule for main handler
:- http_handler(/, index, []).
:- http_handler('/has', has_html, []).
:- http_handler(/, index, []).


%% initiate the server
server(Port) :-
        http_server(http_dispatch, [port(Port)]).


% main requests
index(_Request) :-
    %%load parameters
    sports(Sports),
    score(S),
    scoretotal(TS),
    
    %% all possible has options
    equipment(H1),
    scoringtype(H2),
    gamemode(H3),
    
    tennis(H4),
    diving(H5),
    golf(H6),
    baseball(H7),
    soccer(H8),
    rugby(H9),
    basketball(H10),
    ultimate_frisbee(H11),
    volleyball(H12),
    badminton(H13),
    swimming(H14),
    skiing(H15),
    surfing(H16),
    archery(H17),
    karate(H18),
    bowling(H19),
    dodgeball(H20),
    table_tennis(H21),
    hockey(H22),


    %%write html
    reply_html_page([   
                        title('CZ3005 10 Questions'),
                        script([src = 'web/web.js'],[]),
                        script([src = 'https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js'],[]),
                        link([rel='stylesheet', href='web/web.css'], [])
                        
                      
                    ],
                    [ 
                      
                      %% body
                      h1('Guess the sport in 10 Questions'),
                      %% rules
                      p([id='rules'],['Theme is Sports! ',
                        'Each question increases your score by 1. ',
                        'Each wrong guess increases your score by 1. ',
                        'Try to get the lowest score!'
                      ]),
                      %% score
                      p([id='score'],['Your current score is ', S, '.']),
                      p([id='totalscore'],[' Your total score is ', TS, '.']),
                      
                      %%filters for has options
                      label([for='has_filters'], ['Filters']),
                      select([id='has_filters', form = 'hasform', onChange = 'updatefilter(this)'], 
                          [ option(equipment), 
                            option(scoringtype),
                            option(gamemode),
                            \my_options(Sports)
                          ]),
                      ' <Filters changes the available options below>',
                      
                      %% has form
                      form([id = 'hasform', action='/', method='get'],
                        [
                          'Does the sport have ',
                          select([id = 'h1', name='has'], [\my_options(H1)]),
                          select([id = 'h2', name='has', style = 'display:none'], [\my_options(H2)]),
                          select([id = 'h3', name='has', style = 'display:none'], [\my_options(H3)]),
                          select([id = 'h4', name='has', style = 'display:none'], [\my_options(H4)]), 
                          select([id = 'h5', name='has', style = 'display:none'], [\my_options(H5)]),
                          select([id = 'h6', name='has', style = 'display:none'], [\my_options(H6)]),
                          select([id = 'h7', name='has', style = 'display:none'], [\my_options(H7)]),
                          select([id = 'h8', name='has', style = 'display:none'], [\my_options(H8)]), 
                          select([id = 'h9', name='has', style = 'display:none'], [\my_options(H9)]),
                          select([id = 'h10', name='has', style = 'display:none'], [\my_options(H10)]),
                          select([id = 'h11', name='has', style = 'display:none'], [\my_options(H11)]),
                          select([id = 'h12', name='has', style = 'display:none'], [\my_options(H12)]), 
                          select([id = 'h13', name='has', style = 'display:none'], [\my_options(H13)]),
                          select([id = 'h14', name='has', style = 'display:none'], [\my_options(H14)]),
                          select([id = 'h15', name='has', style = 'display:none'], [\my_options(H15)]),
                          select([id = 'h16', name='has', style = 'display:none'], [\my_options(H16)]), 
                          select([id = 'h17', name='has', style = 'display:none'], [\my_options(H17)]),
                          select([id = 'h18', name='has', style = 'display:none'], [\my_options(H18)]),
                          select([id = 'h19', name='has', style = 'display:none'], [\my_options(H19)]),
                          select([id = 'h20', name='has', style = 'display:none'], [\my_options(H20)]),         
                          select([id = 'h21', name='has', style = 'display:none'], [\my_options(H21)]),
                          select([id = 'h22', name='has', style = 'display:none'], [\my_options(H22)]),                          
                          
                          '? ',
                          button([type='submit'],['Ask a question'])
                      ]),
                      

                      
                      %% is form
                      form([id = 'isform', action='/', method='get'],
                        [
                          'The sport is ',
                          select(
                            [name='is', form = 'isform'], 
                            [ \my_options(Sports)]
                          ),
                          button([type='submit'],['Make a guess'])
                      ])

                      
                    ]).

% has request. Used with Ajax
has_html(_Request) :-
    http_parameters(_Request,
                    [ 
                      has(H, [])
                    ]),
    reply_html_page([],['testtest'], H).
    

    
    
% is request. Used with Ajax

% generate list of options
my_options([]) --> [].      %end of recursion
my_options([H|T]) --> html(option(H)), my_options(T).   %declare list item as html option item


% start the server
:- server(5000).
