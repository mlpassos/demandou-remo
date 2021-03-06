(function ($) {
    "use strict";
    var fn = {
        // Funcionalidades
        Iniciar: function () {
            fn.App();
        },
        App : function () {
            var base_url = 'http://' + window.location.hostname + "/demandou-git";
            var location = base_url + '/tarefas';
            
            // Funções do App
            function mostraOpcoes(codigo_tipo, codigo_observacao) {
                  if (codigo_tipo == 1) {
                       return '<div class="form-group">'
                        + 'Aceitar entrega?<br>' 
                        + '<label class="radio-inline"><input type="radio" id="observacao_extender-' + codigo_observacao + '-sim" name="observacao_extender-' + codigo_observacao + '"> Sim</label>'
                        + '<label class="radio-inline"><input type="radio" id="observacao_extender-' + codigo_observacao + '-nao" name="observacao_extender-' + codigo_observacao + '"> Não</label>'
                        + '</div>';      
                  } else if (codigo_tipo == 2) {
                        return '<div class="form-group">'
                        + 'Extender o prazo?<br>' 
                        + '<label class="radio-inline"><input type="radio" id="observacao_extender-' + codigo_observacao + '-sim" name="observacao_extender-' + codigo_observacao + '"> Sim</label>'
                        + '<label class="radio-inline"><input type="radio" id="observacao_extender-' + codigo_observacao + '-nao" name="observacao_extender-' + codigo_observacao + '"> Não</label>'
                        + '</div>';
                  } else {
                        return '';
                  }
            }
            function mostraResposta(codigo_tarefa, el, codigo_observacao, codigo_tipo, lider) {
                  // se for forçada, mostra OBS pois é final, ou seja, já mostrou
                  // console.log('aqui');
                  if (codigo_tipo == 3) {
                        return 'Forçada, apenas OBS.';
                  } else {
                        var url =  location + '/tarefa/jsontasksrespostas'
                        $.ajax({
                            method: 'post',
                            url: url,
                            data: {
                              'codigo_observacao' : codigo_observacao
                            },
                            dataType: 'json',
                            success: function(data) {
                              console.log(data);
                              if (data.length>0) {
                                    data.forEach(function(item){
                                          var data_resposta = new Date(item.data_resposta);
                                          data_resposta.setDate(data_resposta.getDate() + 1);
                                          el.append('<div class="media">'
                                              + '<p>' + formataData(new Date(data_resposta)) + '</p>'
                                              + '<div class="media-left">'
                                              + '<a href="#">'
                                              + '<img class=" img-circle tarefa-avatar" src="' + location + '/uploads/' + item.arquivo_avatar + '" alt="avatar do avaliador da tarefa">'
                                              + '<small>' + item.nome + ' ' + item.sobrenome + '</small>'
                                              + '</a>'
                                              + '</div>'
                                              + '<div class="media-body">'
                                              + '<h4 class="media-heading">Resposta</h4>'
                                              + '<p>' + item.resposta + '</p>'
                                              + '</div>'
                                              + '</div>');
                                    });
                              } else {
                                     if (lider == 1) {
                                          // mostra form
                                          // alert('aqui');
                                          el.append('<div>'
                                                + '<div class="form-group">'
                                                + '<label for="observacao_responder">Responder Observação</label><br>' 
                                                + '<input type="checkbox" class="switch switch-resposta" id="observacao_responder" name="observacao_responder" data-codigoobservacao="' + codigo_observacao +'">'
                                                + '</div>'
                                                + '<div class="form-group">'
                                                + '<div class="obs-resposta observacao-resposta-' + codigo_observacao + '" data-codigotarefa="' + codigo_tarefa + '" data-lider="' + lider + '" data-tipo="' + codigo_tipo + '">'
                                                + mostraOpcoes(codigo_tipo, codigo_observacao)
                                                + '<label for="observacao_resposta">Observações</label>'
                                                + '<textarea id="observacao_resposta" name="observacao_resposta" class="form-control" rows="3"></textarea>'
                                                + '<button type="button" class="btn btn-primary btn-small" id="resposta_gravar"><i class="fa fa-disk"></i> Responder</button>'
                                                + '<p class="tarefa-resposta-mensagem"></p>'
                                                + '</div>'
                                                + '</div>'
                                                + '</div>');
                                    } else {
                                          // mostra mensagem ainda sem resposta
                                          el.append('<p>Aguardando resposta.</p>');
                                    }
                              }
                            },
                            error: function(erro) {
                              console.log(erro);
                            }
                        }).done(function(data){
                              if (data.length>0) {
                                    // nada, ja respondido
                              } else {
                                    el.find("input[type=checkbox].switch-resposta").each(function() {
                                        $(this).before(
                                          '<span class="switch switch-resposta">' +
                                          '<span class="mask" /><span class="background" />' +
                                          '</span>'
                                        );
                                        // Hide checkbox
                                        $(this).hide();
                                        // Set inital state
                                        if (!$(this)[0].checked) {
                                          //alert('nao marcado');
                                          $(this).prev().find(".background").css({left: "-56px"});
                                        }
                                    }); // End each()
                                    el.find("span.switch-resposta").click(function() {
                                        // If on, slide switch off
                                        console.log('estava ' + $(this).next()[0].checked);
                                        var codigo_observacao = $(this).next()[0].attributes[4].value;
                                        if ($(this).next()[0].checked) {
                                          // console.log('Foi pra ' + $(this).next()[0].checked);
                                          $(this).find(".background").animate({left: "-56px"}, 200);
                                          $('.observacao-resposta-' + codigo_observacao).hide('slow');
                                          // $('#myModalTarefaFinalizar').modal('hide');
                                        // Otherwise, slide switch on
                                        } else {
                                          // console.log($(this).next()[0].attributes[4].value);
                                          // console.log($(this).next()[0].codigotarefa);
                                          // var codigo_tarefa = $(this).next()[0].attr('data-codigotarefa');
                                          $('.observacao-resposta-' + codigo_observacao).show('slow');
                                          // $('#myModalTarefaFinalizar').modal('show');
                                          $(this).find(".background").animate({left: "0px"}, 200);
                                          // console.log($(this).next()[0].checked);
                                        }
                                        // Toggle state of checkbox
                                        $(this).next()[0].checked = !$(this).next()[0].checked;
                                        console.log('está ' + $(this).next()[0].checked);
                                    });
                              }
                        });
                  }   
            }
            function mostrarObs(codigoTarefa, dono, lider, UsuarioTarefaNome, UsuarioTarefaAvatar) { 
                 
                  var url =  location + '/tarefa/jsontasksobs';
                  var resp = "";
                  $.ajax({
                        method: 'post',
                        url: url,
                        // async:false,
                        data: {
                          'codigo_tarefa' : codigoTarefa
                        },
                        dataType: 'json',
                        success: function(data) {
                        //if (data.length>0) {
                              console.log(data);
                              if (data.length>0) {
                                   $('.tarefa-observacoes-' + codigoTarefa).css('display', 'none');
                                   $('#showObs-' + codigoTarefa).removeClass("hidden").addClass("show");
                              }
                              data.forEach(function(item){
                                    // checar se dono da tarefa
                                     if (item.codigo_tipo==3 && dono==0) {
                                          UsuarioTarefaNome = $('#nome_usuario').val();
                                          UsuarioTarefaAvatar = $('#avatar_usuario').val();
                                    } else {
                                           UsuarioTarefaNome = item.nome + ' ' + item.sobrenome;
                                          UsuarioTarefaAvatar = item.arquivo_avatar;
                                    }
                                    // console.log(item);
                                    var el = $('.tarefa-observacoes-' + codigoTarefa);
                                    $('.tarefa-observacoes-' + codigoTarefa).append(''
                                     // observações
                                    + '<div class="media">'
                                    + '<p>' + formataData(new Date(item.obs_data_criada)) + '</p>'
                                    + '<div class="media-left">'
                                    + '<a href="#">'
                                    + '<img class="img-circle tarefa-avatar" src="' + location + '/uploads/' + UsuarioTarefaAvatar + '" alt="avatar do responsável pela tarefa">'
                                    + '<small>' + UsuarioTarefaNome + '</small>'
                                    + '</a>'
                                    + '</div>'
                                    + '<div class="media-body">'
                                    + '<h4 class="media-heading">' + item.tipo + '</h4>'
                                    + '<p>' + item.observacao + '</p>'
                                    + '</div>'
                                    + '</div>');
                                    // respostas passando tipo, só mostra se 1 ou 2
                                    mostraResposta(codigoTarefa, el, item.codigo_observacao, item.codigo_tipo, lider);
                              });
                            },
                            error: function (error) {
                              console.log('erro: ' + error);
                            }
                  });
            }
            function showAndamento(check_fim, check_inicio, total, faltam, hoje, codigoUsuarioAtual, UsuarioTarefaAvatar, UsuarioTarefaNome, codigoUsuarioTarefa,data_inicio,data_prazo, data_fim, codigoTarefa, lider, encerrada, encerrada_por) {
                  var resposta = [], output="", atrasado=0;
                  if (data_fim!==null) {
                              // sendo diferente e não é líder
                              if (lider !== 1) {
                                   output += 'Tempo consumido (%)<div class="progress">'
                                                  + '<div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:100%;min-width: 2em;">'
                                                  + '100%'
                                                  + '</div>'
                                                  + '</div>';
                                    if (encerrada === null) {
                                          output += '<p class="alert alert-info">Finalizada em <em>' + formataData(new Date(data_fim)) + '</em>, aguardando validação.</p>';
                                    } else {
                                          output += '<p class="alert alert-success"><i class="icone-thumbs fa fa-thumbs-up"></i> Tarefa encerrada.</p>';
                                    }
                              }
                  } else {
                        // ainda não finalizou
                        if (encerrada===null) { 
                              if (check_inicio>=0) {
                                        // nao começou
                                        var comecou = false;
                                        if (check_inicio==0) {
                                          output += '<p class="alert alert-info">Começou hoje</p>';
                                        } else {
                                          if (check_inicio == 1) {
                                            output += '<p class="alert alert-info">Começa amanhã</p>';
                                          } else {
                                            output += '<p class="alert alert-info">' + 'Faltam ' + check_inicio + ' dias para começar.' + '</p>';
                                          }
                                        }
                                        // progress bar 0
                                        output += 'Tempo consumido (%)<div class="progress">'
                                                  + '<div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="min-width: 2em;">'
                                                  + '0%'
                                                  + '</div>'
                                                  + '</div>'
                              } else {
                                        var comecou = true;
                                        // começou
                                        if (check_fim<=0) {
                                          if (check_fim==0) { 
                                            var porcento = 100;
                                            output += '<p class="alert alert-info">Termina hoje!</p>';
                                          } else {
                                            // atrasado
                                            var porcento = 100;
                                            var atrasado = 1;
                                            output += '<p class="alert alert-info">' + 'Atrasado ' + ((faltam*(-1)==1) ? faltam*(-1) + ' dia.' : faltam*(-1) + ' dias.') 
                                            // se usuário atual é o dono da tarefa, mostra mensagem sobre negociar prazo.
                                            if (codigoUsuarioAtual == codigoUsuarioTarefa) {
                                                output += ', finalize para negociar novo prazo.</p>';
                                            } else {
                                                output += '</p>';
                                            }
                                          } 
                                        } else {
                                          var porcento = [(total-faltam) * 100] / total;
                                          output += '<p class="alert alert-info">' + ((check_fim==1) ? 'Falta ' + check_fim + ' dia.' : 'Faltam ' + check_fim + ' dias.') + '</p>';
                                          
                                        }
                                        output += 'Tempo consumido (%)<div class="progress">'
                                                  + '<div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="'+ porcento.toFixed(2) + '%' + '" aria-valuemin="0" aria-valuemax="100" style="width:' + porcento.toFixed(2) + '%' + ';min-width: 2em;">'
                                                  + porcento.toFixed(2) + '%'
                                                  + '</div>'
                                                  + '</div>'
                              }
                        } else {
                              output += '<div class="alert alert-danger">Tarefa encerrada pelo líder.</div>';
                        }
                  }
                  resposta = {
                        out: output,
                        late: atrasado
                  }
                  return resposta;
            }
            function usuarioAcoes(codigoUsuarioAtual, UsuarioTarefaAvatar, UsuarioTarefaNome, codigoUsuarioTarefa,data_inicio,data_prazo, data_fim, codigoTarefa, lider, encerrada, encerrada_por) {
                  var hoje = new Date();
                  var data_inicio = new Date(data_inicio);
                  var data_prazo = new Date(data_prazo);
                  var faltam = Math.floor((data_prazo - hoje) / (1000*60*60*24));
                  var total = Math.floor((data_prazo - data_inicio) / (1000*60*60*24));
                  var check_inicio = Math.floor((data_inicio - hoje) / (1000*60*60*24));
                  var check_fim = Math.floor((data_prazo - hoje) / (1000*60*60*24));
                  var atrasado = 0;
                  var output = "";
                  // já finalizou a tarefa e não é dono dela ou líder...
                  if (codigoUsuarioAtual == codigoUsuarioTarefa) {
                        // já faz embaixo
                        var dono = 1;
                  } else {
                        var dono = 0;
                        if (lider == 0) {
                              var andamento = showAndamento(check_fim, check_inicio, total, faltam, hoje, codigoUsuarioAtual, UsuarioTarefaAvatar, UsuarioTarefaNome, codigoUsuarioTarefa,data_inicio,data_prazo, data_fim, codigoTarefa, lider, encerrada, encerrada_por);
                              output += andamento.out;
                        }
                  } 
                  // caso dono da tarefa e ela tenha começado ou seja líder, mostra controles de finalização
                  if ( (check_inicio <= 0 && codigoUsuarioAtual == codigoUsuarioTarefa ) || (lider==1) ) {
                        // já foi finalizada antes?
                        if (data_fim===null) {
                              if (encerrada===null) {
                                    var andamento = showAndamento(check_fim, check_inicio, total, faltam, hoje, codigoUsuarioAtual, UsuarioTarefaAvatar, UsuarioTarefaNome, codigoUsuarioTarefa,data_inicio,data_prazo, data_fim, codigoTarefa, lider, encerrada, encerrada_por);
                                    output += andamento.out;
                                    output += '<button type="button" class="hidden btn btn-xs btn-primary show-obs show-obs-' + codigoTarefa + '" id="showObs-' + codigoTarefa + '">Mostrar histórico</button>';
                                    output += '<p class="tarefa-observacoes tarefa-observacoes-' + codigoTarefa + '"></p>';
                                    mostrarObs(codigoTarefa, dono, lider,UsuarioTarefaNome,UsuarioTarefaAvatar);
                                    output += '<div>'
                                    + '<div class="form-group">'
                                    + '<label for="tarefa_encerrar">Finalizar tarefa</label><br>' 
                                    + '<input type="checkbox" class="switch" id="tarefa_encerrar" name="tarefa_encerrar" data-codigotarefa="' + codigoTarefa +'">'
                                    + '</div>'
                                    + '<div class="form-group">'
                                    + '<div class="tarefa-observacao tarefa-obs-' + codigoTarefa +'" data-atrasado="' + andamento.late + '" data-dono="' + dono + '" data-lider="' + lider + '" data-codigousuario="' + codigoUsuarioTarefa + '">'
                                    + '<label for="tarefa_observacao">Observações</label>'
                                    + '<textarea id="tarefa_observacao" name="tarefa_observacao" class="form-control" rows="3"></textarea>'
                                    // + '<form id="arqObsForm" name="arqObsForm" enctype="multipart/form-data">'
                                    // + '<div class="form-group">'
                                    // + '<label for="arquivo_obs">Anexo(s)</label>'
                                    // + '<input type="file" id="arquivo_obs" name="arquivo_obs">'
                                    // + '<p class="help-block">Conteúdo/Relatório produzido</p>'
                                    // + '</div>'
                                    // + '</form>'
                                    + '<button type="button" class="btn btn-primary btn-small" id="tarefa_gravar"><i class="fa fa-disk"></i> Salvar</button>'
                                    + '<p class="tarefa-observacao-mensagem"></p>'
                                    + '</div>'
                                    + '</div>'
                                    + '</div>';
                              } else {
                                    output += '<div class="alert alert-danger">Tarefa encerrada pelo líder.</div>';
                                     output += '<button type="button" class="hidden btn btn-xs btn-primary show-obs show-obs-' + codigoTarefa + '" id="showObs-' + codigoTarefa + '">Mostrar histórico</button>';
                                    output += '<p class="tarefa-observacoes tarefa-observacoes-' + codigoTarefa + '"></p>';
                                    mostrarObs(codigoTarefa, dono, lider,UsuarioTarefaNome,UsuarioTarefaAvatar);
                              }
                        } else {
                              // verificar se existe solicitação de novo prazo pendente, se tiver exibir a resposta.
                              if (encerrada===null) {
                                    output += '<p class="alert alert-info">Tarefa finalizada em <em>' + formataData(new Date(data_fim)) + '</em>, aguardando validação.</p>';
                                    output += '<button type="button" class="btn btn-xs btn-primary show-obs show-obs-' + codigoTarefa + '" id="showObs-' + codigoTarefa + '" style="display:none;">Mostrar histórico</button>'
                                          +' <p class="tarefa-observacoes tarefa-observacoes-' + codigoTarefa + '">'
                                          + '</p>';
                                    mostrarObs(codigoTarefa, dono, lider,UsuarioTarefaNome,UsuarioTarefaAvatar);
                              } else {
                                    output += '<p class="alert alert-success"><i class="icone-thumbs fa fa-thumbs-up"></i> Tarefa encerrada.</p>';
                                    output += '<button type="button" class="hidden btn btn-xs btn-primary show-obs show-obs-' + codigoTarefa + '" id="showObs-' + codigoTarefa + '">Mostrar histórico</button>'
                                          + '<p class="tarefa-observacoes tarefa-observacoes-' + codigoTarefa + '">'
                                          + '</p>';
                                    mostrarObs(codigoTarefa, dono, lider,UsuarioTarefaNome,UsuarioTarefaAvatar);
                              }
                        }
                  } 
                  return output;
            }
            function getTarefaPrioridade(codigo) {
                  var code = parseInt(codigo);
                  switch(code) {
                       case 3:
                            var out = {
                                'classe': "prioridade-alta",
                                'texto': 'ALTA',
                                'cor': '#ff4332'
                            }
                            break;
                        case 2:
                            // var out = "#FCF8E3";
                            var out = {
                                'classe': "prioridade-media",
                                'texto': 'MÉDIA',
                                'cor': '#ffbe1c'
                            }
                            break;
                        case 1:
                            // var out = "#DFF0D8";
                            var out = {
                                'classe': "prioridade-baixa",
                                'texto': 'BAIXA',
                                'cor': '#77b50e'
                            }
                            break;
                        default:
                            // nothing
                            var out = "erro";
                  }     
                  return out;
            }
            function showPendente(codigo_status, codigo_dono, data_fim,encerrada,lider, codigo_usuario) {
                  // console.log(data_fim,encerrada);
                  if (codigo_status==0) {
                        return "background-color:gray;";            
                  } else {
                        if (lider==1) {
                              if (data_fim==null) {
                                    return ";";
                              } else {
                                    if (encerrada==null) {
                                          return "background-color:red;";
                                    } else {
                                          return "background-color:green;";
                                    }
                              }

                        } else {
                              // console.log(codigo_dono, codigo_usuario);
                              // console.log(codigo_usuario);
                              if (codigo_dono==codigo_usuario) {
                                    return "background-color:orange;";
                              } else {
                                    return ";";
                              }
                        }
                  }
            }
            function formatState (state) {
                  var $state = $(
                    '<span><img src="http://placehold.it/20x20" class="img-circle" /> ' + state.text + '</span>'
                    // '<span>' +  state.element.value.toLowerCase() + '</span>'
                  );
                  return $state;
            }
            function showMensagem(el, data, elbox) {
              var classe = (data.status == "sucesso") ? "alert alert-success" : "alert alert-danger";
              var mensagemHTML = $.parseHTML(data.mensagem);
              el.addClass('alert ' + classe +  ' animated-alt-med fadeInUp').html(mensagemHTML).one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function(){
                    var isso = $(this);
                    setTimeout(function(){
                          isso.removeClass('animated-alt-med fadeInUp').addClass('animated-alt-med fadeOutDown').one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function(){
                                isso.removeClass('animated-alt-med fadeOutDown ' + classe).html('');
                          });
                          if (elbox!=="") {
                                setTimeout(function(){
                                      elbox.hide('slow');
                                },1000);
                          }
                    },500);
                    
              });
            }


            var grid = $('.tarefas-grid').isotope({
                itemSelector: '.cor-coluna',
                layoutMode: 'fitRows',
                getSortData: {
                  titulo: '.tarefa-titulo',
                  prioridade: '.tarefa-prioridade',//,
                  total_tarefas: function( itemElem ) {
                    var valor = $( itemElem ).find('.total_tarefas').text();
                    //console.log(valor);
                    return parseInt(valor);
                  },
                  data_prazo: function( itemElem ) {
                    var valor = $( itemElem ).find('.data_prazo').text();
                    console.log(valor);
                    return new Date(valor);
                  },
                  lider: '[data-filter-by]'
                }
            }).isotopeSearchFilter({
              itemsContainer: $(".tarefas-grid"),
              itemSelector: '.cor-coluna',
              filtersSelector: '.filters'
            });

            var filterFns = {
              // show if number is greater than 50
              totalTasks: function() {
                var number = $(this).find('.total-tarefa').text();
                console.log(number);
                return number;
              },
              // show if name ends with -ium
              lider: function() {
                var nome = [];
                $(this).find('.filter').each(function(){
                  nome.push($(this).attr('data-filter-by'));
                  // console.log(nome);
                });//.attr('data-filter-by');//children().children().children('.tarefas-box-descricao').children('.participantes-lista').children('li').children('img');//text();
                // console.log('nome: ' + nome[1]);
                return nome[1];//.match( name );
              }
            };

            // $('.filter-all').click(function(){

            // });

            $('.filter').click(function(){
               var value = $(this).attr('data-filter-by');
               console.log(value);
               
               grid.isotope({
                filter: value
               });
               if ($('.filter-all').css('display')=='none') {
                $('.filter-all').css({'display':'block'}).addClass('animated-alt fadeInUp').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
                  $(this).removeClass('animated-alt fadeInUp');
                });//.fadeIn('slow');
               } else {
                if ($(this).hasClass('filter-all')) {
                  $('.filter-all').addClass('animated-alt fadeOutDown').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
                    $(this).removeClass('animated-alt fadeOutDown').css({'display':'none'});
                  });//.fadeIn('slo//.fadeOut('slow');
                }
               }
            });
            var count = [];

            $('.sort').click(function(){
              var value = $(this).attr('data-sort-by');

              
              //value = filterFns[ value ] || value;
              console.log($.inArray( value, count ));
              var order = ($(this).attr('data-order-by')=='false') ? false : true;
              var el = $(this).children('i');
              
              if (order) {
                $(this).attr('data-order-by', 'false');
                if ($.inArray( value, count ) !== -1) {
                   if (el.hasClass('fa-sort-asc')) {
                     el.removeClass('fa-sort-asc').addClass('fa-sort-desc');
                   }  else {
                     el.removeClass('fa-sort-desc').addClass('fa-sort-asc');
                   }                 
                }
                count.push(value);
                // if ($.inArray( value, count )) {
                //   // faz nada
                // } else {
                //   count.push(value);  
                // }

                // if (el.hasClass('fa-sort-asc')) {
                //   el.removeClass('fa-sort-asc').addClass('fa-sort-desc');
                // } 
                
                // if (el.hasClass('fa-sort-numeric-asc')) {
                //   el.removeClass('fa-sort-numeric-asc').addClass('fa-sort-numeric-desc');
                // } 
                // if (el.hasClass('fa-sort-alpha-asc')) {
                //   el.removeClass('fa-sort-alpha-asc').addClass('fa-sort-alpha-desc');
                // } 
              } else {
                $(this).attr('data-order-by', 'true');
                if(el.hasClass('fa-sort-desc')) {
                  el.removeClass('fa-sort-desc').addClass('fa-sort-asc');
                } else {
                   el.removeClass('fa-sort-asc').addClass('fa-sort-desc');
                }
                
                // if(el.hasClass('fa-sort-numeric-desc')) {
                //   el.removeClass('fa-sort-numeric-desc').addClass('fa-sort-numeric-asc');
                // }
                // if(el.hasClass('fa-sort-alpha-desc')) {
                //   el.removeClass('fa-sort-alpha-desc').addClass('fa-sort-alpha-asc');
                // }
              }
              //console.log(order);
              grid.isotope({
                sortBy: value,
                sortAscending: order
              });
            });

            $('.projetos-acoes-btn').tooltip({
              'delay': { "show": 500, "hide": 100 }
            });
            $('.tarefa-stats, .filter, .fa-trash-o, .tarefa-desativar, .tarefa-finalizada').tooltip({
              'delay': { "show": 100, "hide": 0 }
            });

           
            $('#myModalConfirmar').on('show.bs.modal', function (event) {
              var button = $(event.relatedTarget); // Button that triggered the modal
              var modal = $(this);
              var codigo_tarefa= button.data('codigotarefa');
              var titulo = button.data('titulo');
              var tipo = button.data('tipo');
              var headerClass = (tipo === "excluir" ? 'bg-excluir' : 'bg-aviso');
              var texto = '<p>' + button.data('texto') + ' <b>' + titulo + '</b>' + '?</p>';
              var foco = modal.find('.confirma-nao');
              modal.find('.modal-body').html('').html(texto);
              modal.find('.modal-header').addClass(headerClass);
              modal.find('.confirma-sim').attr('data-codigotarefa', codigo_tarefa);
              modal.find('.confirma-sim').attr('data-tipo', tipo);
              foco.focus();
            });

            $('#myModalConfirmar').on('shown.bs.modal', function (event) {
              var modal = $(this);
              var foco = modal.find('.confirma-nao');
              foco.focus();
            });


            // function confirmar(codigo) {
            // alert(location);
            $('#myModalConfirmar .confirma-sim').click(function(){
              var ct = $(this).attr('data-codigotarefa');
              var tipo = $(this).attr('data-tipo');
              var el = $('.projeto-'+ct).parent();
              console.log('el: ' + el.attr('class'));
              // alert($(this).attr('data-codigoprojeto'));
              if (tipo == "excluir") {
                var url = location.replace('tarefas','tarefa/excluir');
                // console.log(url);
                // exclui
                $.ajax({
                  method: 'post',
                  url: url,
                  data: {
                    'codigo_tarefa' : ct
                  },
                  dataType: 'json',
                  success: function(data) {
                    console.log(data);
                    if (data.status == "sucesso") {
                      grid.isotope( 'remove', el ).isotope('layout');
                    } else {
                      alert('Deu bug, tente novamente? =]');
                    }
                  },
                  error: function(error) {
                    console.log(error);
                  }
                });
              } else if (tipo == "finalizar") {
                var url = location.replace('tarefas','/tarefa/encerrar');
                // finaliza
                $.ajax({
                  method: 'post',
                  url: url,
                  data: {
                    'codigo_tarefa' : ct
                  },
                  dataType: 'json',
                  success: function(data) {
                    console.log(data);
                    if (data.status == "sucesso") {
                      grid.isotope( 'remove', el ).isotope('layout');
                    } else {
                      alert('Deu bug, tente novamente? =]');
                    }
                  },
                  error: function(error) {
                    console.log(error);
                  }
                });
              }
            });
            // }


            var location = 'http://' + window.location.hostname + "/demandou-git/tarefas";

            var month = new Array();
                month[0] = "Janeiro";
                month[1] = "Fevereiro";
                month[2] = "Março";
                month[3] = "Abril";
                month[4] = "Maio";
                month[5] = "Junho";
                month[6] = "Julho";
                month[7] = "Agosto";
                month[8] = "Setembro";
                month[9] = "Outubro";
                month[10] = "Novembro";
                month[11] = "Dezembro";
            var weekday = new Array();
                weekday[0] = "Domingo";
                weekday[1] = "Segunda-feira";
                weekday[2] = "Terça-feira";
                weekday[3] = "Quarta-feira";
                weekday[4] = "Quinta-feira";
                weekday[5] = "Sexta-feira";
                weekday[6] = "Sábado";
            // var n = month[d.getMonth()];
            function formataData(strData) {
                  return weekday[strData.getDay()] + ', ' + strData.getDate() + ' de ' + month[strData.getMonth()] + ' de ' + strData.getFullYear();
            }
            $('#myModalTarefaVer').on('hidden.bs.modal', function (event) {
                     var modal = $(this);
                     // modal.find('.modal-tarefas-lista').html('');
                     modal.find('.modal-body').find('.data-faltam').html('');
                     modal.find('.modal-title').text('');
                     modal.find('.modal-body').find('.descricao').text('');
                     modal.find('.modal-body').find('.data-inicio').text('');
                     modal.find('.modal-body').find('.data-prazo').text('');
            });
            $('#myModalTarefaVer').on('show.bs.modal', function (event) {
                    var button = $(event.relatedTarget); // Button that triggered the modal
                    var modal = $(this);
                    var codigo_projeto = button.data('codigoprojeto');
                    var titulo = button.data('titulo');
                    var descricao = button.data('descricao');
                    var prioridade = button.data('prioridade');
                    var data_inicio = new Date(button.data('inicio'));
                    data_inicio.setDate(data_inicio.getDate() + 1);
                    var data_prazo = new Date(button.data('prazo'));
                    data_prazo.setDate(data_prazo.getDate() + 1);
                    var hoje = new Date();
                    var faltam = Math.floor((data_prazo - hoje) / (1000*60*60*24));
                    var total = Math.floor((data_prazo - data_inicio) / (1000*60*60*24));
                    var check_inicio = Math.floor((data_inicio - hoje) / (1000*60*60*24));
                    var check_fim = Math.floor((data_prazo - hoje) / (1000*60*60*24));
                    modal.find('.modal-header').css('background-color', getTarefaPrioridade(prioridade).cor);

                    if (check_inicio>=0) {
                            // nao começou
                            var comecou = false;
                            if (check_inicio==0) {
                              modal.find('.modal-body').find('.data-faltam').text('Começou hoje!');
                            } else {
                              if (check_inicio == 1) {
                                modal.find('.modal-body').find('.data-faltam').text('Começa Amanhã');
                              } else {
                                modal.find('.modal-body').find('.data-faltam').text('Faltam ' + check_inicio + ' dias para começar.');
                              }
                            }
                            modal.find('.modal-body').find('.progress').find('.progress-bar').css('width', '0%').text('0%');
                    } else {
                            var comecou = true;
                            // começou
                            if (check_fim<=0) {
                              if (check_fim==0) { 
                                var porcento = 100;
                                modal.find('.modal-body').find('.data-faltam').text('Termina hoje');
                              } else {
                                // atrasado
                                modal.find('.modal-body').find('.data-faltam').text('Atrasado ' + faltam*(-1) + ' dias.');
                                var porcento = 100;
                              } 
                            } else {
                              modal.find('.modal-body').find('.data-faltam').text('Faltam ' + check_fim + ' dias para terminar.');
                              var porcento = [(total-faltam) * 100] / total;
                            }
                            modal.find('.modal-body').find('.progress').find('.progress-bar').css('width', porcento.toFixed(2) + '%').text(porcento.toFixed(2)+'%');
                    }
                    // ajax pegando os dados da tarefa
                      modal.find('.modal-title').text(titulo);
                      modal.find('.modal-body').find('.descricao').html(descricao);
                      modal.find('.modal-body').find('.data-inicio').text('Início: ' + formataData(data_inicio));
                      modal.find('.modal-body').find('.data-prazo').text('Prazo: ' + formataData(data_prazo));
            });
            
            $('body').delegate('.show-obs','click',function(){
                  $(this).next().stop(true,true).slideToggle("slow");
            });

            var elmodal = null;
            
            
        
            var moda = null;
            $('#myModalTarefaAlterar').on('show.bs.modal', function (event) {
                    moda = $('#myModalTarefaVer');
                    var button = $(event.relatedTarget); // Button that triggered the modal
                    var codigo_tarefa = button.data('codigo');
                    var titulo = button.data('titulo');
                    var descricao = button.data('descricao');
                    var prioridade = button.data('prioridade');
                    var data_inicio = button.data('inicio');
                    var data_prazo = button.data('prazo');
                    var lider = button.data('lider');
                    var codigo_projeto = button.data('codigoprojeto');
                    var codigo_status = button.data('codigostatus');
                    //modalflag = codigo_projeto;
                    // console.log(button);
                    var modal = $(this);
                    modal.find('.modal-title').text('Alterar Tarefa: ' + codigo_tarefa);
                    modal.find('#titulo').val(titulo);
                    modal.find('#descricao').val(descricao);

                    // tinymce.init({
                    //   selector: '#myModalTarefaAlterar textarea',
                    //   // forced_root_block : "",
                    //   invalid_elements: "table,tr,td,tbody,img",
                    //   height: 200,
                    //   plugins: [
                    //     'advlist autolink lists link charmap print preview anchor',
                    //     'searchreplace visualblocks code fullscreen',
                    //     'insertdatetime media contextmenu paste code'
                    //   ],
                    //   toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
                    //   content_css: [
                    //     '//fast.fonts.net/cssapi/e6dc9b99-64fe-4292-ad98-6974f93cd2a2.css',
                    //     '//www.tinymce.com/css/codepen.min.css'
                    //   ]
                    // });

                    tinymce.init({
                      selector: '#myModalTarefaAlterar textarea',
                      invalid_elements: "table,tr,td,tbody,img",
                      height: 150,
                      plugins: [
                        'advlist autolink lists link charmap print preview anchor',
                        'searchreplace visualblocks code fullscreen',
                        'insertdatetime media paste code textcolor colorpicker wordcount'
                      ],
                      plugin_insertdate_dateFormat : "%d/%m/%Y",
                      plugin_insertdate_timeFormat : "%H:%M:%S",
                      language: 'pt_BR',
                      language_url: base_url + '/assets/js/tinymce/langs/pt_BR.js',
                      browser_spellcheck: true,
                      contextmenu: false,
                      toolbar: 'insertfile undo redo | styleselect | bold italic | forecolor backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link',
                      content_css: [
                        '//fast.fonts.net/cssapi/e6dc9b99-64fe-4292-ad98-6974f93cd2a2.css',
                        '//www.tinymce.com/css/codepen.min.css'
                      ]
                    });

                    modal.find('#data_inicio').val(data_inicio);
                    modal.find('#data_prazo').val(data_prazo);
                    modal.find('input[type="radio"]').each(function(){
                        if ($(this).attr('value') == prioridade) {
                              $(this).attr('checked', true);      
                        }
                        console.log($(this).attr('value'));
                    });
                    modal.find('input[name="codigo_projeto"]').val(codigo_projeto);
                    modal.find('input[name="codigo_tarefa"]').val(codigo_tarefa);
                    modal.find('input[name="codigo_status"]').each(function(){
                        // alert(typeof codigo_status);
                        if ($(this).attr('value')=="1") {
                              if (codigo_status==1) {
                                    // alert('here');
                                    $(this).attr('checked', 'checked');
                              }
                        } else {
                              if (codigo_status==0) {
                                    $(this).attr('checked', 'checked');
                              }
                        }
                    });

                    $.ajax({
                          url: location.replace('tarefas', 'projeto/jsonprojectusers'),
                          type: "POST",
                          data: {
                              codigo_projeto:codigo_projeto 
                          },
                          dataType: 'json',
                          success: function(data) {
                              console.log(data);
                              $("#lider").html('');
                              data.forEach(function(item){
                                    if (item.codigo == lider) {
                                          $("#lider").append('<option value="' + item.codigo + '" selected>' + item.nome + ' ' + item.sobrenome  + '</option>');      
                                    } else {
                                          $("#lider").append('<option value="' + item.codigo + '">' + item.nome + ' ' + item.sobrenome  + '</option>');      
                                    }
                                    
                              });
                              
                          },
                          error: function(stc,error){
                              console.log(error);
                              console.log(stc)
                          }
                     }).done(function(data){
                        console.log('fim participantes');
                        $("#lider").select2({
                           maximumSelectionLength: 1,
                           templateResult: formatState
                        });
                     });
            });

            $('#myModalTarefaAlterar').on('hide.bs.modal', function (event) {
                  // moda.modal('hide');
                  window.location = location;
            });

            $('#myModalTarefaAlterar').on('hidden.bs.modal', function (event) {
                $('.form-message').removeClass('alert alert-success alert-danger').text('');  
            });

            $('body').delegate('#frmTarefa-Alterar', 'submit', function(e) {
                  e.preventDefault();
                  // var data = $(this).serialize();
                  var form = $(this);
                  var codigo_projeto = form.find("input[name='codigo_projeto']").val();
                  var codigo_tarefa = form.find("input[name='codigo_tarefa']").val();
                  var titulo = form.find("#titulo").val();
                  var descricao = form.find("#descricao").val();
                  var prioridade = null;
                  form.find("input[name='prioridade']").each(function(){
                        if ($(this).is(':checked')) {
                              prioridade = $(this).val();
                        }
                  });
                  var data_inicio = form.find("#data_inicio").val();
                  var data_prazo = form.find("#data_prazo").val();
                  var lider = form.find('#lider').val();
                  var codigo_status = "";
                  form.find('#codigo_status').each(function(){
                        if ($(this).is(':checked')) {
                              codigo_status = $(this).val();
                        } else {
                              codigo_status = '0';
                        }
                  });
                  var data = {codigo_projeto,codigo_tarefa,titulo,descricao,prioridade,data_inicio,data_prazo,lider,codigo_status};
                  //alert(data_inicio);
                  console.log(data);
                  var el = form.find('.form-message');
                  el.html('<img src="http://cdn2.rode.com/images/common/ajax-loader-black.gif" alt="imagem mostra que sistema está trabalhando">');//text('Atualizando dados e notificando líder.')
                  $.ajax({
                          url: location.replace('tarefas', '/tarefa/alterar'),
                          type: "POST",
                          data: {
                              codigo_projeto : codigo_projeto,
                              codigo_tarefa : codigo_tarefa,
                              titulo : titulo,
                              descricao : descricao,
                              prioridade : prioridade,
                              data_inicio : data_inicio,
                              data_prazo : data_prazo,
                              lider : lider,
                              codigo_status
                          },
                          dataType: 'json',
                          success: function(data) {
                              el.html('');
                              showMensagem(el, data);
                              $('.fechar').focus();
                          },
                          error: function(stc,error){
                              console.log(error);
                              console.log(stc)
                          }
                     }).done(function(data){
                        console.log('fim alteração');
                     });
            });

            $('body').delegate('#tarefa_gravar','click', function(){
                  var res = $(this).parent().parent().parent().find('input#tarefa_encerrar.switch')[0].checked;
                  // // console.log(res);
                  if (res) {
                    // grava
                    var el = $(this).parent().find('.tarefa-observacao-mensagem');
                    var elbox = $(this).parent();
                    var observacao = $(this).parent().find('#tarefa_observacao').val();
                    var lider = $(this).parent().attr('data-lider');
                    var atrasado = $(this).parent().attr('data-atrasado');
                    var codigo_usuario = $(this).parent().attr('data-codigousuario');
                    var codigo_tarefa = $(this).parent().attr('class').match(/\d+/)[0];
                    var resp = {observacao,lider,atrasado,codigo_usuario,codigo_tarefa};
                    console.log(resp);
                    var url =  location + '/tarefa/finalizar';
                    $.ajax({
                            method: 'post',
                            url: url,
                            data: {
                              'codigo_tarefa' : codigo_tarefa,
                              'observacao' : observacao,
                              'lider': lider,
                              'atrasado' : atrasado,
                              'codigo_usuario': codigo_usuario
                            },
                            dataType: 'json',
                            success: function(data) {
                              console.log(data);
                              showMensagem(el, data, elbox);
                              },
                            error: function(error) {
                              console.log(error);
                            }
                    });
                  }
            });

        }
    }
    $(document).ready(function () {
        fn.Iniciar();
    });
})(jQuery);