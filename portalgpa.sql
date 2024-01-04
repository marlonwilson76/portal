CREATE TABLE atendente( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`system_user_id\` int   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE atendimento( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`tipo_atendimento_id\` int   NOT NULL  , 
      \`setor_id\` int   NOT NULL  , 
      \`cliente_id\` int   NOT NULL  , 
      \`cliente_usuario_id\` int   NOT NULL  , 
      \`atendente_id\` int   , 
      \`arquivos\` text   , 
      \`data_abertura\` date   , 
      \`data_fechamento\` date   , 
      \`mensagem\` text   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE atendimento_interacao( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`atendimento_id\` int   NOT NULL  , 
      \`atendente_id\` int   , 
      \`cliente_usuario_id\` int   , 
      \`arquivos\` text   , 
      \`mensagem\` text   , 
      \`data_interacao\` datetime   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE bairro( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`nome\` text   , 
      \`cidade_id\` int   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE cad_familia( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`dt_cadastro\` date   , 
      \`nome_resp\` text   NOT NULL  , 
      \`cpf_resp\` int   NOT NULL  , 
      \`tipo_residencia\` text   , 
      \`renda_familia\` text   , 
      \`programas_assist\` int   , 
      \`local_domicilio\` text   , 
      \`abast_agua\` text   , 
      \`esgoto\` text   , 
      \`lixo\` text   , 
      \`tipo_familia\` text   , 
      \`povo_tribo\` text   , 
      \`qt_pessoas\` int   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE categoria_guia( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`nome\` text   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE cep_cache( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`cep\` varchar  (10)   , 
      \`rua\` varchar  (10)   , 
      \`cidade\` varchar  (500)   , 
      \`bairro\` varchar  (500)   , 
      \`codigo_ibge\` varchar  (20)   , 
      \`uf\` varchar  (2)   , 
      \`cidade_id\` int   , 
      \`estado_id\` int   , 
      \`created_at\` datetime   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE cidade( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`estado_id\` int   NOT NULL  , 
      \`nome\` varchar  (255)   NOT NULL  , 
      \`codigo_ibge\` varchar  (10)   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE cliente( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`cad_familia_id\` int   NOT NULL  , 
      \`nome\` text   NOT NULL  , 
      \`ativo\` char  (1)   , 
      \`sexo\` text   NOT NULL  , 
      \`dt_nasc\` date   , 
      \`raca_cor\` text   , 
      \`parentesco\` text   , 
      \`nis\` int   , 
      \`endereco\` text   , 
      \`situacao_rua\` char   , 
      \`cpf\` int   NOT NULL  , 
      \`email\` text   , 
      \`telefone\` text   , 
      \`rg\` text   , 
      \`mae\` text   , 
      \`pai\` text   , 
      \`ponto_referencia\` text   , 
      \`created_at\` datetime   , 
      \`data_desativacao\` date   , 
      \`pessoa_deficiencia\` char   , 
      \`tipo_deficiencia\` text   , 
      \`escola\` text   , 
      \`escola_frequenta\` text   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE cliente_usuario( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`cliente_id\` int   NOT NULL  , 
      \`system_user_id\` int   , 
      \`ativo\` char  (1)   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE documento( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`cliente_id\` int   NOT NULL  , 
      \`tipo_documento_id\` int   NOT NULL  , 
      \`created_by_system_user_id\` int   , 
      \`vaildade\` date   , 
      \`arquivo\` text   , 
      \`observacao\` text   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE documento_download_log( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`documento_id\` int   NOT NULL  , 
      \`downloaded_by_system_user_id\` int   NOT NULL  , 
      \`data_download\` datetime   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE encaminhamento( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`dt_emissao\` date   NOT NULL  , 
      \`cliente_id\` int   NOT NULL  , 
      \`setor_id\` int   NOT NULL  , 
      \`tipo_atendimento_id\` int   NOT NULL  , 
      \`endereco\` text   , 
      \`objetivo\` text   , 
      \`necessidade\` text   , 
      \`observacao\` text   , 
      \`cliente_usuario_id\` int   , 
      \`setor_solicitante\` text   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE estado( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`nome\` varchar  (255)   NOT NULL  , 
      \`sigla\` char  (2)   NOT NULL  , 
      \`codigo_ibge\` varchar  (10)   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE fila_email( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`fila_email_status_id\` int   NOT NULL  , 
      \`titulo\` text   , 
      \`conteudo\` text   , 
      \`arquivos\` text   , 
      \`destinatarios\` text   , 
      \`tentativas_envio\` int   , 
      \`tipo_origem\` text   , 
      \`erro\` text   , 
      \`data_envio\` datetime   , 
      \`criado_em\` datetime   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE fila_email_status( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`nome\` text   , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE guia( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`subcategoria_guia_id\` int   NOT NULL  , 
      \`cliente_id\` int   NOT NULL  , 
      \`created_by_system_user_id\` int   NOT NULL  , 
      \`ano_competencia\` int   NOT NULL  , 
      \`mes_competencia\` int   NOT NULL  , 
      \`data_vencimento\` date   NOT NULL  , 
      \`download_pos_vencimento\` char  (1)   NOT NULL    DEFAULT 'F', 
      \`arquivo\` text   NOT NULL  , 
      \`downloaded\` char  (1)   NOT NULL    DEFAULT 'F', 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE guia_download_log( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`guia_id\` int   NOT NULL  , 
      \`downloaded_by_system_user_id\` int   NOT NULL  , 
      \`data_download\` datetime   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE link_util( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`created_by_system_user_id\` int   NOT NULL  , 
      \`titulo\` text   NOT NULL  , 
      \`descricao\` text   NOT NULL  , 
      \`link\` text   NOT NULL  , 
      \`ativo\` char  (1)   NOT NULL    DEFAULT 'T', 
      \`criado_em\` datetime   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE noticia( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`created_by_system_user_id\` int   NOT NULL  , 
      \`titulo\` text   NOT NULL  , 
      \`descricao_resumida\` text   NOT NULL  , 
      \`conteudo\` text   NOT NULL  , 
      \`foto_capa\` text   NOT NULL  , 
      \`data_noticia\` datetime   NOT NULL  , 
      \`ativo\` char  (1)   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE pagina_conhecimento( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`created_by_system_user_id\` int   NOT NULL  , 
      \`titulo\` text   NOT NULL  , 
      \`conteudo\` text   NOT NULL  , 
      \`descricao_resumida\` text   NOT NULL  , 
      \`ativo\` char  (1)   NOT NULL    DEFAULT 'T', 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE setor( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`nome\` text   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE setor_atendente( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`setor_id\` int   NOT NULL  , 
      \`atendente_id\` int   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE subcategoria_guia( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`nome\` text   NOT NULL  , 
      \`categoria_guia_id\` int   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE template_email( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`nome\` text   NOT NULL  , 
      \`titulo\` text   NOT NULL  , 
      \`conteudo\` text   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE tipo_atendimento( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`nome\` text   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE tipo_documento( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`nome\` text   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

CREATE TABLE vinculo_familiar( 
      \`id\`  INT  AUTO_INCREMENT    NOT NULL  , 
      \`cad_familia_id\` int   NOT NULL  , 
      \`cliente_id\` int   NOT NULL  , 
 PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

 
  
 ALTER TABLE atendimento ADD CONSTRAINT fk_atendimento_1 FOREIGN KEY (tipo_atendimento_id) references tipo_atendimento(id); 
ALTER TABLE atendimento ADD CONSTRAINT fk_atendimento_2 FOREIGN KEY (setor_id) references setor(id); 
ALTER TABLE atendimento ADD CONSTRAINT fk_atendimento_3 FOREIGN KEY (cliente_id) references cliente(id); 
ALTER TABLE atendimento ADD CONSTRAINT fk_atendimento_4 FOREIGN KEY (atendente_id) references atendente(id); 
ALTER TABLE atendimento ADD CONSTRAINT fk_atendimento_5 FOREIGN KEY (cliente_usuario_id) references cliente_usuario(id); 
ALTER TABLE atendimento_interacao ADD CONSTRAINT fk_atendimento_interacao_1 FOREIGN KEY (atendimento_id) references atendimento(id); 
ALTER TABLE atendimento_interacao ADD CONSTRAINT fk_atendimento_interacao_2 FOREIGN KEY (atendente_id) references atendente(id); 
ALTER TABLE atendimento_interacao ADD CONSTRAINT fk_atendimento_interacao_3 FOREIGN KEY (cliente_usuario_id) references cliente_usuario(id); 
ALTER TABLE bairro ADD CONSTRAINT fk_bairro_1 FOREIGN KEY (cidade_id) references cidade(id); 
ALTER TABLE cidade ADD CONSTRAINT fk_cidade_1 FOREIGN KEY (estado_id) references estado(id); 
ALTER TABLE cliente ADD CONSTRAINT fk_cliente_1 FOREIGN KEY (cad_familia_id) references cad_familia(id); 
ALTER TABLE cliente_usuario ADD CONSTRAINT fk_cliente_usuario_1 FOREIGN KEY (cliente_id) references cliente(id); 
ALTER TABLE documento ADD CONSTRAINT fk_documento_1 FOREIGN KEY (cliente_id) references cliente(id); 
ALTER TABLE documento ADD CONSTRAINT fk_documento_2 FOREIGN KEY (tipo_documento_id) references tipo_documento(id); 
ALTER TABLE documento_download_log ADD CONSTRAINT fk_documento_download_log_1 FOREIGN KEY (documento_id) references documento(id); 
ALTER TABLE encaminhamento ADD CONSTRAINT fk_encaminhamento_1 FOREIGN KEY (cliente_id) references cliente(id); 
ALTER TABLE encaminhamento ADD CONSTRAINT fk_encaminhamento_2 FOREIGN KEY (tipo_atendimento_id) references tipo_atendimento(id); 
ALTER TABLE encaminhamento ADD CONSTRAINT fk_encaminhamento_3 FOREIGN KEY (setor_id) references setor(id); 
ALTER TABLE encaminhamento ADD CONSTRAINT fk_encaminhamento_5 FOREIGN KEY (cliente_usuario_id) references cliente_usuario(id); 
ALTER TABLE fila_email ADD CONSTRAINT fk_fila_email_1 FOREIGN KEY (fila_email_status_id) references fila_email_status(id); 
ALTER TABLE guia ADD CONSTRAINT fk_guia_1 FOREIGN KEY (subcategoria_guia_id) references subcategoria_guia(id); 
ALTER TABLE guia ADD CONSTRAINT fk_guia_2 FOREIGN KEY (cliente_id) references cliente(id); 
ALTER TABLE guia_download_log ADD CONSTRAINT fk_guia_download_log_1 FOREIGN KEY (guia_id) references guia(id); 
ALTER TABLE setor_atendente ADD CONSTRAINT fk_setor_atendente_1 FOREIGN KEY (setor_id) references setor(id); 
ALTER TABLE setor_atendente ADD CONSTRAINT fk_setor_atendente_2 FOREIGN KEY (atendente_id) references atendente(id); 
ALTER TABLE subcategoria_guia ADD CONSTRAINT fk_subcategoria_guia_1 FOREIGN KEY (categoria_guia_id) references categoria_guia(id); 
ALTER TABLE vinculo_familiar ADD CONSTRAINT fk_vinculo_familiar_1 FOREIGN KEY (cad_familia_id) references cad_familia(id); 
ALTER TABLE vinculo_familiar ADD CONSTRAINT fk_vinculo_familiar_2 FOREIGN KEY (cliente_id) references cliente(id); 
INSERT INTO atendente (id,system_user_id) VALUES (1,1); 

INSERT INTO atendimento (id,tipo_atendimento_id,setor_id,cliente_id,cliente_usuario_id,atendente_id,arquivos,data_abertura,data_fechamento,mensagem) VALUES (1,1,1,1,1,1,'',null,null,''); 

INSERT INTO atendimento_interacao (id,atendimento_id,atendente_id,cliente_usuario_id,arquivos,mensagem,data_interacao) VALUES (1,1,1,1,'','',null); 

INSERT INTO bairro (id,nome,cidade_id) VALUES (1,'TREZE CASAS',1); 

INSERT INTO bairro (id,nome,cidade_id) VALUES (2,'SERINGAL',1); 

INSERT INTO cad_familia (id,dt_cadastro,nome_resp,cpf_resp,tipo_residencia,renda_familia,programas_assist,local_domicilio,abast_agua,esgoto,lixo,tipo_familia,povo_tribo,qt_pessoas) VALUES (1,null,'MARLON LOPES',62904833234,'','',null,'','','','','','',null); 

INSERT INTO categoria_guia (id,nome) VALUES (1,'VIAGEM'); 

INSERT INTO cidade (id,estado_id,nome,codigo_ibge) VALUES (1,1,'SANTANA DO ARAGUAIA','1506708'); 

INSERT INTO cliente (id,cad_familia_id,nome,ativo,sexo,dt_nasc,raca_cor,parentesco,nis,endereco,situacao_rua,cpf,email,telefone,rg,mae,pai,ponto_referencia,created_at,data_desativacao,pessoa_deficiencia,tipo_deficiencia,escola,escola_frequenta) VALUES (1,1,'MARLON LOPES','','1',null,'','',null,'','',62904833234,'','','','','','',null,null,'','','',''); 

INSERT INTO cliente_usuario (id,cliente_id,system_user_id,ativo) VALUES (1,1,null,''); 

INSERT INTO documento (id,cliente_id,tipo_documento_id,created_by_system_user_id,vaildade,arquivo,observacao) VALUES (1,1,1,null,null,'',''); 

INSERT INTO documento_download_log (id,documento_id,downloaded_by_system_user_id,data_download) VALUES (1,1,1,'18/10/2023'); 

INSERT INTO encaminhamento (id,dt_emissao,cliente_id,setor_id,tipo_atendimento_id,endereco,objetivo,necessidade,observacao,cliente_usuario_id,setor_solicitante) VALUES (1,'18/10/2023',1,1,1,'','','','',null,'CRAS'); 

INSERT INTO estado (id,nome,sigla,codigo_ibge) VALUES (1,'PARÁ','PA','15067'); 

INSERT INTO fila_email (id,fila_email_status_id,titulo,conteudo,arquivos,destinatarios,tentativas_envio,tipo_origem,erro,data_envio,criado_em) VALUES (1,1,'','','','',null,'','',null,null); 

INSERT INTO fila_email_status (id,nome) VALUES (1,'EMAIL_TODOS'); 

INSERT INTO guia (id,subcategoria_guia_id,cliente_id,created_by_system_user_id,ano_competencia,mes_competencia,data_vencimento,download_pos_vencimento,arquivo,downloaded) VALUES (1,1,1,1,2023,9,'31/12/2023','F','SQLSTATE[23000]: Integrity constraint violation: 19 NOT NULL constraint failed: cliente.cad_familia_id.','F'); 

INSERT INTO guia_download_log (id,guia_id,downloaded_by_system_user_id,data_download) VALUES (1,1,1,'18/10/2023'); 

INSERT INTO setor (id,nome) VALUES (1,'CRAS'); 

INSERT INTO setor (id,nome) VALUES (2,'CREAS'); 

INSERT INTO setor_atendente (id,setor_id,atendente_id) VALUES (1,1,1); 

INSERT INTO subcategoria_guia (id,nome,categoria_guia_id) VALUES (1,'PASSAGEM RODOVIARIA',1); 

INSERT INTO template_email (id,nome,titulo,conteudo) VALUES (1,'MAMMAMA','SUAS','SUAS NA VIDA'); 

INSERT INTO tipo_atendimento (id,nome) VALUES (1,'ATUALIZAR CADASTRO'); 

INSERT INTO tipo_documento (id,nome) VALUES (1,'CARTEIRA IDOSO'); 

INSERT INTO tipo_documento (id,nome) VALUES (2,'CPF'); 
