-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-02-28 19:44:38.186

-- tables
-- Table: cartao_credito
CREATE TABLE cartao_credito (
    limite money  NOT NULL,
    saldo_disponivel money  NOT NULL,
    cvv_cartao_credito int  NOT NULL,
    senha int  NOT NULL,
    id_cartao_de_credito serial  NOT NULL,
    data_fechamento_fatura date  NOT NULL,
    data_validade date  NOT NULL,
    data_pagamento_fatura date  NOT NULL,
    cliente_num_conta_corrente int  NOT NULL,
    CONSTRAINT cartao_credito_pk PRIMARY KEY (id_cartao_de_credito)
);

-- Table: chave_pix
CREATE TABLE chave_pix (
    chave varchar(100)  NOT NULL,
    tipo_de_chave char(10)  NOT NULL,
    id_chave_pix serial  NOT NULL,
    receber_pix_id_receber_pix int  NOT NULL,
    enviar_pix_id_enviar_pix int  NOT NULL,
    cliente_num_conta_corrente int  NOT NULL,
    CONSTRAINT chave_pix_pk PRIMARY KEY (id_chave_pix)
);

-- Table: cliente
CREATE TABLE cliente (
    nome varchar(20)  NOT NULL,
    sobrenome varchar(50)  NOT NULL,
    data_nascimeto date  NOT NULL,
    cpf varchar(11)  NOT NULL,
    rg int  NOT NULL,
    email varchar(100)  NOT NULL,
    senha_acesso varchar(8)  NOT NULL,
    senha_motivacao varchar(6)  NOT NULL,
    saldo money  NOT NULL,
    assinatura_digital bytea  NOT NULL,
    foto_carteira_ident bytea  NOT NULL,
    data_validade_cartao_corrente date  NOT NULL,
    num_conta_corrente serial  NOT NULL,
    filiacao_cliente_id_filiacao int  NOT NULL,
    naturalidade_cliente_id_naturalidade int  NOT NULL,
    endereco_cliente_id_endereco_cliente int  NOT NULL,
    telefone_cliente_id_telefone int  NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY (num_conta_corrente)
);

-- Table: compra_credito
CREATE TABLE compra_credito (
    nome_original varchar(60)  NOT NULL,
    name_atual varchar(60)  NOT NULL,
    valor money  NOT NULL,
    intituicao_destinaria_comp varchar(60)  NOT NULL,
    id_compra_credito serial  NOT NULL,
    data_compra date  NOT NULL,
    cartao_credito_id_cartao_de_credito int  NOT NULL,
    localizacao_compra_id_localizacao_compra int  NOT NULL,
    horario_compra time  NOT NULL,
    CONSTRAINT compra_credito_pk PRIMARY KEY (id_compra_credito)
);

-- Table: convidado_cliente
CREATE TABLE convidado_cliente (
    num_conta_distinario int  NULL,
    id_convidado int  NOT NULL,
    cliente_num_conta_corrente int  NOT NULL,
    CONSTRAINT convidado_cliente_pk PRIMARY KEY (id_convidado)
);

-- Table: deposito
CREATE TABLE deposito (
    saldo_depositado int  NOT NULL,
    hora_deposito time  NOT NULL,
    id_deposito serial  NOT NULL,
    data_deposito date  NOT NULL,
    cliente_num_conta_corrente int  NOT NULL,
    CONSTRAINT deposito_pk PRIMARY KEY (id_deposito)
);

-- Table: endereco_cliente
CREATE TABLE endereco_cliente (
    cidade varchar(80)  NOT NULL,
    pais varchar(80)  NOT NULL,
    estado varchar(80)  NOT NULL,
    municipio varchar(80)  NOT NULL,
    centro varchar(80)  NOT NULL,
    rua varchar(80)  NOT NULL,
    num_da_residencia int  NOT NULL,
    cep int  NOT NULL,
    id_endereco_cliente serial  NOT NULL,
    CONSTRAINT endereco_cliente_pk PRIMARY KEY (id_endereco_cliente)
);

-- Table: enviar_pix
CREATE TABLE enviar_pix (
    chave_destinataria varchar(100)  NOT NULL,
    tipo_de_chave_destinataria char(10)  NOT NULL,
    nome_destinatario char(60)  NOT NULL,
    cpf_destinatario int  NOT NULL,
    instituicao_destinataria char(60)  NOT NULL,
    saldo_enviado money  NOT NULL,
    hora_de_envio time  NOT NULL,
    foto_reconhecimento_facial bytea  NOT NULL,
    numero_conta_remetente int  NOT NULL,
    id_enviar_pix serial  NOT NULL,
    data_pix date  NOT NULL,
    CONSTRAINT enviar_pix_pk PRIMARY KEY (id_enviar_pix)
);

-- Table: fazer_transferencia
CREATE TABLE fazer_transferencia (
    tipo_conta_destinaria char(10)  NOT NULL,
    num_conta_destinataria int  NOT NULL,
    cpf_destinatario int  NOT NULL,
    saldo_transferido int  NOT NULL,
    institucao_destinataria char(60)  NOT NULL,
    nome_destinatario char(60)  NOT NULL,
    horario_transferencia time  NOT NULL,
    id_fazer_transferencia serial  NOT NULL,
    data_tranferencia date  NOT NULL,
    cliente_num_conta_corrente int  NOT NULL,
    CONSTRAINT fazer_transferencia_pk PRIMARY KEY (id_fazer_transferencia)
);

-- Table: filiacao_cliente
CREATE TABLE filiacao_cliente (
    nome_mae varchar(20)  NOT NULL,
    sobrenome_mae varchar(50)  NOT NULL,
    nome_pai varchar(20)  NULL,
    sobrenome_pai varchar(50)  NULL,
    id_filiacao serial  NOT NULL,
    CONSTRAINT filiacao_cliente_pk PRIMARY KEY (id_filiacao)
);

-- Table: localizacao_compra
CREATE TABLE localizacao_compra (
    cidade_comp varchar(80)  NOT NULL,
    estado_comp varchar(80)  NOT NULL,
    municipio_comp varchar(80)  NOT NULL,
    pais_comp varchar(80)  NOT NULL,
    centro_comp varchar(80)  NOT NULL,
    rua_comp varchar(80)  NOT NULL,
    cep_comp int  NOT NULL,
    id_localizacao_compra serial  NOT NULL,
    CONSTRAINT localizacao_compra_pk PRIMARY KEY (id_localizacao_compra)
);

-- Table: naturalidade_cliente
CREATE TABLE naturalidade_cliente (
    cidade varchar(20)  NOT NULL,
    estado varchar(20)  NOT NULL,
    pais varchar(20)  NOT NULL,
    id_naturalidade serial  NOT NULL,
    CONSTRAINT naturalidade_cliente_pk PRIMARY KEY (id_naturalidade)
);

-- Table: pagamento
CREATE TABLE pagamento (
    valor_pago int  NOT NULL,
    institucao_destinataria char(60)  NOT NULL,
    codigo_barra varchar(44)  NOT NULL,
    foto_rechecimento_facial bytea  NOT NULL,
    hora time  NOT NULL,
    id_pagamento int  NOT NULL,
    data_pagemnto date  NOT NULL,
    cliente_2_num_conta_corrente int  NOT NULL,
    CONSTRAINT pagamento_pk PRIMARY KEY (id_pagamento)
);

-- Table: receber_pix
CREATE TABLE receber_pix (
    nome_remetente char(60)  NOT NULL,
    cpf_remetente int  NOT NULL,
    instituicao_remetente char(60)  NOT NULL,
    saldo_recebido money  NOT NULL,
    chave_do_remetente varchar(100)  NOT NULL,
    hora_recebida time  NOT NULL,
    id_receber_pix serial  NOT NULL,
    data date  NOT NULL,
    CONSTRAINT receber_pix_pk PRIMARY KEY (id_receber_pix)
);

-- Table: receber_transferencia
CREATE TABLE receber_transferencia (
    tipo_conta_remetente char(10)  NOT NULL,
    nome_remetente char(60)  NOT NULL,
    cpf_remetente int  NOT NULL,
    saldo_transferido money  NOT NULL,
    intituicao_remetente char(60)  NOT NULL,
    id_receber_transferencia serial  NOT NULL,
    data date  NOT NULL,
    cliente_num_conta_corrente int  NOT NULL,
    CONSTRAINT receber_transferencia_pk PRIMARY KEY (id_receber_transferencia)
);

-- Table: saque
CREATE TABLE saque (
    saldo_saque money  NOT NULL,
    hora_saque time  NOT NULL,
    foto_reconhecimento_facial bytea  NOT NULL,
    id_saque serial  NOT NULL,
    saque_localizacao_id_localizacao_saque int  NOT NULL,
    data_saque date  NOT NULL,
    cliente_num_conta_corrente int  NOT NULL,
    CONSTRAINT saque_pk PRIMARY KEY (id_saque)
);

-- Table: saque_localizacao
CREATE TABLE saque_localizacao (
    cidade_saq varchar(80)  NOT NULL,
    estado_saq varchar(80)  NOT NULL,
    municipio_saq varchar(80)  NOT NULL,
    centro_saq varchar(80)  NOT NULL,
    rua_saq varchar(80)  NOT NULL,
    cep_saq int  NOT NULL,
    pais_saq varchar(80)  NOT NULL,
    id_localizacao_saque serial  NOT NULL,
    CONSTRAINT saque_localizacao_pk PRIMARY KEY (id_localizacao_saque)
);

-- Table: telefone_cliente
CREATE TABLE telefone_cliente (
    num_telefone int  NULL,
    ddd int  NULL,
    id_telefone serial  NOT NULL,
    CONSTRAINT telefone_cliente_pk PRIMARY KEY (id_telefone)
);

-- foreign keys
-- Reference: cartao_credito_cliente (table: cartao_credito)
ALTER TABLE cartao_credito ADD CONSTRAINT cartao_credito_cliente
    FOREIGN KEY (cliente_num_conta_corrente)
    REFERENCES cliente (num_conta_corrente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: chave_pix_cliente (table: chave_pix)
ALTER TABLE chave_pix ADD CONSTRAINT chave_pix_cliente
    FOREIGN KEY (cliente_num_conta_corrente)
    REFERENCES cliente (num_conta_corrente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: chave_pix_enviar_pix (table: chave_pix)
ALTER TABLE chave_pix ADD CONSTRAINT chave_pix_enviar_pix
    FOREIGN KEY (enviar_pix_id_enviar_pix)
    REFERENCES enviar_pix (id_enviar_pix)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: chave_pix_receber_pix (table: chave_pix)
ALTER TABLE chave_pix ADD CONSTRAINT chave_pix_receber_pix
    FOREIGN KEY (receber_pix_id_receber_pix)
    REFERENCES receber_pix (id_receber_pix)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: cliente_endereco_cliente (table: cliente)
ALTER TABLE cliente ADD CONSTRAINT cliente_endereco_cliente
    FOREIGN KEY (endereco_cliente_id_endereco_cliente)
    REFERENCES endereco_cliente (id_endereco_cliente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: cliente_filiacao_cliente (table: cliente)
ALTER TABLE cliente ADD CONSTRAINT cliente_filiacao_cliente
    FOREIGN KEY (filiacao_cliente_id_filiacao)
    REFERENCES filiacao_cliente (id_filiacao)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: cliente_naturalidade_cliente (table: cliente)
ALTER TABLE cliente ADD CONSTRAINT cliente_naturalidade_cliente
    FOREIGN KEY (naturalidade_cliente_id_naturalidade)
    REFERENCES naturalidade_cliente (id_naturalidade)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: cliente_telefone_cliente (table: cliente)
ALTER TABLE cliente ADD CONSTRAINT cliente_telefone_cliente
    FOREIGN KEY (telefone_cliente_id_telefone)
    REFERENCES telefone_cliente (id_telefone)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: compra_credito_cartao_credito (table: compra_credito)
ALTER TABLE compra_credito ADD CONSTRAINT compra_credito_cartao_credito
    FOREIGN KEY (cartao_credito_id_cartao_de_credito)
    REFERENCES cartao_credito (id_cartao_de_credito)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: compra_credito_localizacao_compra (table: compra_credito)
ALTER TABLE compra_credito ADD CONSTRAINT compra_credito_localizacao_compra
    FOREIGN KEY (localizacao_compra_id_localizacao_compra)
    REFERENCES localizacao_compra (id_localizacao_compra)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: convidado_cliente_cliente (table: convidado_cliente)
ALTER TABLE convidado_cliente ADD CONSTRAINT convidado_cliente_cliente
    FOREIGN KEY (cliente_num_conta_corrente)
    REFERENCES cliente (num_conta_corrente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: deposito_cliente (table: deposito)
ALTER TABLE deposito ADD CONSTRAINT deposito_cliente
    FOREIGN KEY (cliente_num_conta_corrente)
    REFERENCES cliente (num_conta_corrente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fazer_transferencia_cliente (table: fazer_transferencia)
ALTER TABLE fazer_transferencia ADD CONSTRAINT fazer_transferencia_cliente
    FOREIGN KEY (cliente_num_conta_corrente)
    REFERENCES cliente (num_conta_corrente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: pagamento_cliente (table: pagamento)
ALTER TABLE pagamento ADD CONSTRAINT pagamento_cliente
    FOREIGN KEY (cliente_2_num_conta_corrente)
    REFERENCES cliente (num_conta_corrente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: receber_transferencia_cliente (table: receber_transferencia)
ALTER TABLE receber_transferencia ADD CONSTRAINT receber_transferencia_cliente
    FOREIGN KEY (cliente_num_conta_corrente)
    REFERENCES cliente (num_conta_corrente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: saque_cliente (table: saque)
ALTER TABLE saque ADD CONSTRAINT saque_cliente
    FOREIGN KEY (cliente_num_conta_corrente)
    REFERENCES cliente (num_conta_corrente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: saque_saque_localizacao (table: saque)
ALTER TABLE saque ADD CONSTRAINT saque_saque_localizacao
    FOREIGN KEY (saque_localizacao_id_localizacao_saque)
    REFERENCES saque_localizacao (id_localizacao_saque)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

