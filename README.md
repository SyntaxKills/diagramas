Diagramas do Sistema do Restaurante

## Diagrama de Casos de Uso

```mermaid
%%{init: {"theme":"neutral"}}%%
graph LR
    subgraph Sistema["Sistema do Restaurante"]
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

    Cliente[Cliente] --> UC1
    Cliente --> UC2
    Cliente --> UC4
    Cliente --> UC5
    Cliente --> UC7
    Cliente --> UC11

    Garcom[Garçom] --> UC1
    Garcom --> UC4
    Cozinheiro[Cozinheiro] --> UC3
    Caixa[Caixa] --> UC5
    Gerente[Gerente] --> UC6

    Valet[Valet] --> UC7
    Valet --> UC8
    Valet --> UC9
    Valet --> UC10
    Valet --> UC11
```
    
Descrição

O diagrama de casos de uso apresenta as principais interações entre os atores e o sistema do restaurante. Ele contempla o registro e acompanhamento de pedidos, preparação das refeições, solicitação e pagamento da conta, gerenciamento do cardápio e controle dos veículos no estacionamento.

Atores

- Cliente: realiza pedidos, acompanha o pedido, solicita a conta, realiza o pagamento e solicita o veículo.
- Garçom: registra os pedidos, encaminha-os para a cozinha e entrega a conta.
- Cozinheiro: recebe e prepara os pedidos.
- Caixa: processa e confirma os pagamentos.
- Gerente: gerencia o cardápio.
- Valet: recebe, registra, estaciona, localiza e devolve os veículos.

Condições

- O cliente deve estar associado a uma mesa ou atendimento.
- O cardápio deve estar atualizado e disponível.
- Os itens solicitados devem estar disponíveis.
- O sistema deve estar funcionando para registrar pedidos e pagamentos.

Fluxo Principal

- O cliente solicita o cardápio.
- O sistema apresenta os itens disponíveis.
- O cliente seleciona os itens e suas quantidades.
- O sistema registra o pedido e calcula o valor.
- O cliente confirma o pedido.
- O garçom registra e encaminha o pedido para a cozinha.
- A cozinha prepara a refeição.
- O garçom recebe e serve a refeição.
- O cliente solicita a conta.
- O sistema calcula o valor total.
- O cliente realiza o pagamento.
- O caixa processa o pagamento.
- O sistema confirma o pagamento e finaliza o atendimento.

Fluxos Alternativos

- Item indisponível: o sistema informa que o item está indisponível e solicita sua remoção ou substituição.
- Falha no pagamento: o sistema informa a falha e permite uma nova tentativa com outra forma de pagamento.
- Veículo não localizado: o Valet realiza uma nova consulta no registro do estacionamento.

Pós-condições

- O pedido fica registrado no sistema.
- A comanda da cozinha é gerada.
- O status do pedido é atualizado conforme seu andamento.
- O pagamento aprovado é registrado.
- O veículo é atualizado no sistema após sua devolução.

---

## Diagrama de Atividades

```mermaid
%%{init: {"theme":"neutral"}}%%
flowchart TB
    INICIO((INÍCIO))

    subgraph CLIENTE["CLIENTE"]
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

    subgraph VALET["VALET"]
        V1["Recebe o veículo"]
        V2["Registra o veículo"]
        V3["Estaciona o veículo"]
        V4["Aguarda solicitação"]
        V5["Localiza o veículo"]
        V6["Retira o veículo"]
        V7["Entrega o veículo"]
    end

    subgraph GARCOM["GARÇOM"]
        G1["Recebe o pedido"]
        G2["Registra o pedido"]
        G3["Envia o pedido para a cozinha"]
        G4["Recebe a refeição pronta"]
        G5["Serve o cliente"]
        G6["Entrega a conta"]
    end

    subgraph COZINHA["COZINHA"]
        K1["Recebe o pedido"]
        K2["Prepara a refeição"]
        K3["Finaliza o prato"]
        K4["Disponibiliza a refeição"]
    end

    subgraph CAIXA["CAIXA"]
        P1["Calcula o valor da conta"]
        P2["Processa o pagamento"]
        D1{"Pagamento aprovado?"}
        P3["Confirma o pagamento"]
        P4["Solicita nova tentativa"]
    end

    FIM((FIM))

    INICIO --> C1
    C1 --> C2 --> V1 --> V2 --> V3 --> C3
    C3 --> C4 --> G1 --> G2 --> G3 --> K1
    K1 --> K2 --> K3 --> K4 --> G4 --> G5 --> C5
    C5 --> C6 --> C7 --> G6 --> P1 --> C8 --> P2 --> D1
    D1 -->|Sim| P3
    D1 -->|Não| P4
    P4 --> C8
    P3 --> C9 --> V4 --> V5 --> V6 --> V7 --> C10 --> C11 --> FIM
```
