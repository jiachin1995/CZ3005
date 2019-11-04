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
:- http_handler('/is', is_html, []).


%% initiate the server
server(Port) :-
        http_server(http_dispatch, [port(Port)]).


% main requests
index(_Request) :-
    %%load parameters
    sports(Sports),
    score(S),
    scoretotal(TS),
    counter(V),
    round(R),
    
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
                      h1([id = 'header'], 'Guess the sport in 10 Questions'),
                      %% rules

                      div([id = 'mid_container'],[
                          div([id='rules'],[
                            h4('Rules'),
                            div([],['Theme is Sports! ']),
                            div([],['Each question increases your score by 1. ']),
                            div([],['Each wrong guess increases your score by 1. ']),
                            div([],['Try to get the lowest score!'])
                          ]),
                          %% scoreboard & rounds
                          div([id = 'scoreboard'],[
                            h4([id='round'],['Round ',R,' of 5']),
                          
                            div([id='score'],['Your current score is ', S, '.']),
                            div([id='totalscore'],[' Your total score is ', TS, '.'])
                          ]),
                          
                          
                          
                          
                          %% if new round, reset cookies
                          script([],[
                                'var counter = ',
                                V,
                                '; ',
                                'if (counter==0) {resetCookie();}'
                            ]),


                          %% history
                          div([id = 'history'],[]),
                          script([],['showHistory();'])
                      ]),

                      
                      div([id = 'has_container'],[
                          %%filters for has options
                          h2('Select a filter and ask a question'),
                          
                          
                          label([for='has_filters'], ['Filters']),
                          select([id='has_filters', form = 'hasform', onChange = 'updatefilter(this)'], 
                              [ option(equipment), 
                                option(scoringtype),
                                option(gamemode),
                                \my_options(Sports)
                              ]),
                          
                          div([],['<Filters changes the available options below>']),
                          
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
                              button([onclick="ajaxHas()", type='button'],['Ask a question'])
                          ])
                      
                      ]),
                      
                      

                      h2('Make a guess'),
                      
                      %% is form
                      form([id = 'isform', action='/', method='get'],
                        [
                          'The sport is ',
                          select(
                            [id='is', form = 'isform'], 
                            [ \my_options(Sports)]
                          ),
                          button([id='guessbutton', onclick="ajaxIs()", type='button'],['Make a guess'])
                      ]),
                      div([id = 'guess_result'],[])
                
                      
                    ]).

% has request. Used with Ajax
has_html(_Request) :-


    % get http parameters
    http_parameters(_Request,
                    [ 
                      has(H, [])
                    ]),
    increment,      /*increment questions counter*/
	counter(V),
	

    

    	/*if questions counter less than 10*/
	V =< 10 -> 			
	
	/*then statement*/
	incrementscore,
    selected(S),
    call(S, L),         /*Evaluates S(L). Get list L of selected sport S..*/
    
    %get current score
    score(X),
    scoretotal(TX),
    
    
    
	/* if hasitem is true. This is a second if else statement */
	(hasitem(L, H) ->
		reply_html_page([],[
                div([id='hasresponse'],['Yes:', H, ':', X, ':', TX])
            ]);
		reply_html_page([],[
                div([id='hasresponse'],['No:', H, ':', X, ':', TX])
                
            ])
	);
	
	/*else*/
    reply_html_page([],[
            div([id='hasresponse'],['10 limit reached'])
        ]). 
    
% is request. Used with Ajax
is_html(_Request) :-
    % get http parameters
    http_parameters(_Request,
                    [ 
                      is(X, [])
                    ]),

    selected(S),                    /* get selected S*/
    
	(X = S ->
        addscoretotal,
        
        round(R),
        (R < 5 ->
            %start new round
            initcounter,
            initscore,
            incrementround,
            set_select,
            
            %% http response
            reply_html_page([],[
                    div([id='isresponse'],['Correct'])
                ]);
                
            % reset game
            initscoretotal,
            initround,
            init_selection,
            initcounter,
            initscore,
            incrementround,
            set_select,
            reply_html_page([],[
                    div([id='isresponse'],['Game Over'])
                ])
            )
            
    );
        

    incrementscore,            /* else, increment score*/
    
    score(S),
    scoretotal(TS),
    reply_html_page([],[
            div([id='isresponse'],['Wrong:',S,':',TS])
            
        ]). 
    




% generate list of options
my_options([]) --> [].      %end of recursion
my_options([H|T]) --> html(option(H)), my_options(T).   %declare list item as html option item


% start the server
:- server(5000).
