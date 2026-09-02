# Diagramas do Sistema do Restaurante

## 1. Diagrama de Atividades

```mermaid
flowchart TB

    INICIO((Início))

    subgraph CLIENTE["Cliente"]
        C1["Chega ao restaurante"]
        C2["Entrega o veículo ao Valet"]
        C3["Entra no restaurante"]
        C4["Realiza o pedido"]
        C5["Aguarda a refeição"]
        C6["Consome a refeição"]
        C7["Solicita a conta"]
        C8["Realiza o pagamento"]
        C9["Solicita o veículo"]
        C10["Recebe o veículo"]
        C11["Sai do restaurante"]
    end

    subgraph VALET["Valet"]
        V1["Recebe o veículo"]
        V2["Registra o veículo"]
        V3["Estaciona o veículo"]
        V4["Aguarda solicitação"]
        V5["Localiza o veículo"]
        V6["Retira o veículo"]
        V7["Entrega o veículo"]
    end

    subgraph GARCOM["Garçom"]
        G1["Recebe o pedido"]
        G2["Registra o pedido"]
        G3["Envia o pedido para a cozinha"]
        G4["Recebe a refeição pronta"]
        G5["Serve o cliente"]
        G6["Entrega a conta"]
    end

    subgraph COZINHA["Cozinha"]
        K1["Recebe o pedido"]
        K2["Prepara a refeição"]
        K3["Finaliza o prato"]
        K4["Disponibiliza a refeição"]
    end

    subgraph CAIXA["Caixa"]
        P1["Calcula o valor da conta"]
        P2["Processa o pagamento"]
        D1{"Pagamento aprovado?"}
        P3["Confirma o pagamento"]
        P4["Solicita nova tentativa"]
    end

    FIM((Fim))

    INICIO --> C1
    C1 --> C2
    C2 --> V1
    V1 --> V2
    V2 --> V3
    V3 --> C3

    C3 --> C4
    C4 --> G1
    G1 --> G2
    G2 --> G3
    G3 --> K1

    K1 --> K2
    K2 --> K3
    K3 --> K4
    K4 --> G4
    G4 --> G5
    G5 --> C5

    C5 --> C6
    C6 --> C7
    C7 --> G6
    G6 --> P1
    P1 --> C8
    C8 --> P2
    P2 --> D1

    D1 -->|Sim| P3
    D1 -->|Não| P4
    P4 --> C8

    P3 --> C9
    C9 --> V4
    V4 --> V5
    V5 --> V6
    V6 --> V7
    V7 --> C10
    C10 --> C11
    C11 --> FIM
```

---

## 2. Diagrama de Caso de Uso

```mermaid
flowchart LR

    Cliente[Cliente]
    Garcom[Garçom]
    Cozinheiro[Cozinheiro]
    Caixa[Caixa]
    Gerente[Gerente]
    Valet[Valet]

    subgraph SISTEMA["Sistema do Restaurante"]
        UC1((Fazer Pedido))
        UC2((Acompanhar Pedido))
        UC3((Preparar Refeição))
        UC4((Solicitar Conta))
        UC5((Processar Pagamento))
        UC6((Gerenciar Cardápio))
        UC7((Receber Veículo))
        UC8((Registrar Veículo))
        UC9((Estacionar Veículo))
        UC10((Localizar Veículo))
        UC11((Devolver Veículo))
    end

    Cliente --> UC1
    Cliente --> UC2
    Cliente --> UC4
    Cliente --> UC5
    Cliente --> UC10
    Cliente --> UC11

    Garcom --> UC1
    Garcom --> UC4

    Cozinheiro --> UC3

    Caixa --> UC5

    Gerente --> UC6

    Valet --> UC7
    Valet --> UC8
    Valet --> UC9
    Valet --> UC10
    Valet --> UC11
```

---

## 3. Descrição do Caso de Uso

### Caso de Uso: Fazer Pedido

O caso de uso descreve o processo pelo qual o cliente seleciona os itens disponíveis no cardápio e realiza um pedido no sistema do restaurante.

### Atores

- **Cliente:** seleciona os itens, confirma o pedido e acompanha seu andamento.
- **Garçom:** registra o pedido e encaminha as informações para a cozinha.
- **Cozinheiro:** recebe o pedido e prepara a refeição.
- **Caixa:** processa o pagamento da conta.
- **Gerente:** gerencia os itens disponíveis no cardápio.
- **Valet:** recebe, registra, estaciona, localiza e devolve os veículos.

### Condições

- O cliente deve estar associado a uma mesa ou atendimento.
- O cardápio deve estar atualizado e disponível no sistema.
- Os itens solicitados devem estar disponíveis para preparo.
- O sistema deve estar funcionando corretamente.

### Fluxo Principal

1. O cliente solicita o cardápio.
2. O sistema apresenta os itens disponíveis.
3. O cliente seleciona os itens e suas respectivas quantidades.
4. O sistema registra os itens e calcula o valor total.
5. O cliente confirma o pedido.
6. O garçom registra o pedido.
7. O pedido é encaminhado para a cozinha.
8. A cozinha prepara a refeição.
9. O garçom recebe e serve a refeição ao cliente.
10. O cliente solicita a conta.
11. O sistema calcula o valor total da conta.
12. O cliente realiza o pagamento.
13. O caixa processa o pagamento.
14. O sistema confirma o pagamento e finaliza o atendimento.

### Fluxos Alternativos

- **FE01 - Item indisponível:** caso um item selecionado esteja indisponível, o sistema informa o cliente e solicita a remoção ou substituição do item antes da confirmação do pedido.

- **FE02 - Falha no pagamento:** caso o pagamento seja recusado, o sistema informa o cliente e permite uma nova tentativa utilizando outra forma de pagamento.

### Pós-condições

- O pedido é registrado no sistema.
- A comanda da cozinha é gerada.
- O status do pedido é atualizado conforme seu andamento.
- O pagamento aprovado é registrado no sistema.
- O atendimento é finalizado após a confirmação do pagamento.

## Execução

## Execução

1. Instalação:
```bash
cd /sdcard/
git clone https://github.com/SyntaxKiils/diagramas.git
cd diagramas
bash run.sh
