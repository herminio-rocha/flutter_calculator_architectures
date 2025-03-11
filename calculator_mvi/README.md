<h1 align="center">Calculator - MVI</h1>

<br>
<p align="center">
  <strong>🇧🇷 Português</strong>
</p>

<h2>✨ Sobre o Projeto</h2>
<p>O Calculator MVI é um projeto desenvolvido em Flutter, estruturado seguindo o padrão arquitetural MVI (Model-View-Intent). O objetivo deste projeto é demonstrar como organizar um código altamente reativo e previsível, garantindo um fluxo de dados unidirecional e imutável, facilitando a escalabilidade e a manutenção.

Diferente do MVC e do MVVM, onde a interface pode reagir a mudanças de estado de forma mais flexível, o MVI impõe um fluxo previsível e controlado de atualizações, garantindo que a UI reflita exatamente o estado atual da aplicação.

Este projeto faz parte do repositório Flutter Calculator Architectures, onde diferentes abordagens arquiteturais são exploradas e comparadas.</p>

<br>
<h2>📚 O que é MVI?</h2>
<p>O Model-View-Intent (MVI) é um padrão arquitetural que reforça um fluxo unidirecional de dados, garantindo que o estado da aplicação seja imutável e previsível. Ele divide a aplicação em três camadas principais:</p>
<div align="center">
  <table>
    <thead>
      <tr>
        <th align="center">Camada</th>
        <th align="center">Responsabilidade</th>
        <th align="center">No Projeto</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td align="center">Model</td>
        <td align="center">Gerencia os dados e a lógica de negócios. Define os estados imutáveis da aplicação.</td>
        <td align="center"><i>Calculation, CalculatorModel, MathExpressionProcessor</i></td>
      </tr>
      <tr>
        <td align="center">View</td>
        <td align="center">Responsável por exibir a interface gráfica e capturar interações do usuário.</td>
        <td align="center"><i>AndroidCalculatorView, IosCalculatorView</i></td>
      </tr>
      <tr>
        <td align="center">Intent</td>
        <td align="center">Representa as intenções do usuário. Cada ação é transformada em um evento que atualiza o estado da aplicação.</td>
        <td align="center"><i>CalculatorBloc, CalculatorEvent, CalculatorState</i></td>
      </tr>
    </tbody>
  </table>
</div>
<p>A grande diferença do MVI é que a View nunca altera diretamente o Model. Toda interação do usuário gera um evento (Intent), que passa pelo fluxo de dados e gera um novo estado imutável, refletido na interface.</p>


<h3>📌 Decisões Técnicas</h3>
<ul>
  <li>Repository atua como a única fonte de entrada dos dados, nesse caso usada para as configurações dos botões.</li>
  <li>Views foram separadas por plataforma (Android e iOS).</li>
  <li>Para implementar um fluxo de dados imutável e previsível, optei por utilizar o Bloc. Algumas razões para essa escolha:</li>
  <ul>
    <li><strong>Gerenciamento de Estado Eficiente</strong>: O Bloc trabalha com eventos e estados, garantindo que o fluxo de dados siga o conceito unidirecional do MVI.</li>
    <li><strong>Separação de Responsabilidades</strong>: A lógica de negócios fica completamente isolada da UI, permitindo código mais organizado e modular.</li>
    <li><strong>Previsibilidade e Depuração</strong>: Como os estados são imutáveis, conseguimos rastrear cada mudança no fluxo da aplicação, facilitando testes e manutenção.</li>
  </ul>
</ul>



<br>
<h2>🚀 Por que usar MVI?</h2>
<p>O MVI é ideal para projetos que exigem alta previsibilidade, garantindo que cada interação do usuário gere um novo estado da interface, sem efeitos colaterais inesperados. Algumas vantagens incluem:</p>
<ul>
  <li><strong>Fluxo de dados mais seguro</strong>: A interface sempre reflete o estado correto da aplicação.</li>
  <li><strong>Facilidade de Testes</strong>: Como cada atualização da UI é baseada em um novo estado, os testes unitários se tornam mais precisos.</li>
  <li><strong>Escalabilidade e manutenção</strong>: Organiza melhor o código em aplicações grandes, reduzindo acoplamento.</li>
  <li><strong>Previsibilidade total</strong>: Você sempre sabe em que estado sua aplicação está e como ela chegou ali.</li>
</ul>

<br>
<h2>🔎 Como o MVI funciona neste projeto?</h2>
<ol>
  <li><strong>O usuário interage com a View</strong>: Pressiona um botão na calculadora.</li>
  <li><strong>A View dispara uma Intent</strong>: Gera um evento (CalculatorEvent) e o envia para o Bloc.</li>
  <li><strong>O Bloc processa o evento e gera um novo estado</strong>: O cálculo é realizado e o Bloc emite um novo CalculatorState.</li>
  <li><strong>A View recebe o novo estado</strong>: Se atualiza automaticamente.</li>
</ol>

<br>
<h2>🏗 Estrutura do Código</h2>
<p>A organização do projeto segue a estrutura padrão do Flutter, adaptada ao MVI, garantindo clareza e modularidade:</p>
<ul>
  <li><strong>lib/</strong>: Código-fonte principal do projeto.</li>
  <li><strong>lib/src/data/model/</strong>: Lógica de cálculo, manipulação de dados e regras de negócio.</li>
  <li><strong>lib/src/screens/</strong>: Telas da interface gráfica.</li>
  <li><strong>lib/src/widgets/</strong>: Widgets da interface gráfica.</li>
  <li><strong>lib/src/data/bloc/</strong>: Gerenciamento de estado com Bloc (Eventos, Estados e a Lógica de Negócio).</li>
  <li><strong>lib/src/data/repository/</strong>: Centraliza a configuração dos botões da calculadora.</li>
  <li><strong>lib/src/data/util/</strong>: Classes utilitárias.</li>
  <li><strong>lib/src/data/helper/</strong>: Classes helper.</li>
</ul>


<br>
<h2>🎯 Considerações Finais</h2>
<p align="center"><em>Este projeto demonstra como o MVI, aliado ao Bloc, pode melhorar a organização e previsibilidade do código, garantindo que o fluxo de dados seja seguro, escalável e testável.<br>Embora seja um padrão mais avançado, seu uso traz benefícios para aplicações reativas e de grande porte, onde o controle do estado é essencial.</em></p>
<p align="center"><em>Agradeço por explorar este estudo e espero que ele seja útil para aprendizado, referência e inspiração. 🚀</em></p>
<p align="center"><em>Jesus abençoe a todos 🙏</em></p>
<h2></h2>
<br>

<br>
<p align="center">
  <strong>🇺🇸 English</strong>
</p>

<h2>✨ About the Project</h2>
<p>Calculator MVI is a Flutter project structured following the MVI (Model-View-Intent) architectural pattern. The goal of this project is to demonstrate how to organize highly reactive and predictable code by ensuring an immutable, unidirectional data flow, making scalability and maintenance easier.

Unlike MVC and MVVM, where the UI can react to state changes more flexibly, MVI enforces a controlled and predictable update flow, ensuring that the UI always reflects the exact current state of the application.

This project is part of the Flutter Calculator Architectures repository, where different architectural approaches are explored and compared.</p>

<br>
<h2>📚 What is MVI?</h2>
<p>The Model-View-Intent (MVI) pattern reinforces a unidirectional data flow, ensuring that the application state remains immutable and predictable. It divides the application into three main layers:</p>
<div align="center">
  <table>
    <thead>
      <tr>
        <th align="center">Layer</th>
        <th align="center">Responsibility</th>
        <th align="center">In This Project</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td align="center">Model</td>
        <td align="center">Manages data and business logic. Defines the immutable states of the application.</td>
        <td align="center"><i>Calculation, CalculatorModel, MathExpressionProcessor</i></td>
      </tr>
      <tr>
        <td align="center">View</td>
        <td align="center">Displays the user interface and captures user interactions.</td>
        <td align="center"><i>AndroidCalculatorView, IosCalculatorView</i></td>
      </tr>
      <tr>
        <td align="center">Intent</td>
        <td align="center">Represents user intentions. Each action is transformed into an event that updates the application state.</td>
        <td align="center"><i>CalculatorBloc, CalculatorEvent, CalculatorState</i></td>
      </tr>
    </tbody>
  </table>
</div>
<p>The key difference in MVI is that the View never directly modifies the Model. Every user interaction triggers an event (Intent), which passes through the data flow and generates a new immutable state, reflected in the UI.</p>

<h3>📌 Technical Decisions</h3>
<ul>
  <li>The Repository serves as the single source of truth for button configurations.</li>
  <li>Views are separated by platform (Android and iOS).</li>
  <li>To implement an immutable and predictable data flow, I chose to use Block. Some reasons for this choice:</li>
  <ul>
    <li><strong>Efficient State Management</strong>: The bLoc works with events and states, ensuring that the data flow follows the unidirectional concept of MVI.</li>
    <li><strong>Separation of Responsibilities</strong>: Business logic is completely isolated from the UI, allowing for more organized and modular code.</li>
    <li><strong>Predictability and Debugging</strong>: Since states are immutable, we can track every change in the application flow, making testing and maintenance easier.</li>
  </ul>
</ul>

<br>
<h2>🚀 Why Use MVI?</h2>
<p>MVI is ideal for projects that require high predictability, ensuring that every user interaction generates a new UI state without unexpected side effects. Some benefits include:</p>
<ul>
  <li><strong>Safer Data Flow</strong>: The UI always reflects the correct application state.</li>
  <li><strong>Easier Testing</strong>: Since every UI update is based on a new state, unit tests become more precise.</li>
  <li><strong>Scalability and Maintenance</strong>: Better code organization in large applications, reducing coupling.</li>
  <li><strong>Total Predictability</strong>: You always know exactly what state your application is in and how it got there.</li>
</ul>

<br>
<h2>🔎 How Does MVI Work in This Project?</h2>
<ol>
  <li><strong>The user interacts with the View</strong>: Presses a button on the calculator.</li>
  <li><strong>The View triggers an Intent</strong>: Generates an event (CalculatorEvent) and sends it to the Bloc.</li>
  <li><strong>The Bloc processes the event and generates a new state</strong>: The calculation is performed, and the Bloc emits a new CalculatorState.</li>
  <li><strong>The View receives the new state</strong>: It automatically updates itself.</li>
</ol>

<br>
<h2>🏗 Project Structure</h2>
<p>The project follows the standard Flutter structure, adapted for MVC to ensure clarity and modularity:</p>
<ul>
  <li><strong>lib/</strong>: Main project source code.</li>
  <li><strong>lib/src/data/model/</strong>: Business logic, calculations, and data processing.</li>
  <li><strong>lib/src/screens/</strong>: UI screens.</li>
  <li><strong>lib/src/widgets/</strong>: UI components.</li>
  <li><strong>lib/src/data/bloc</strong>: State management with Bloc (Events, States, and Business Logic).</li>
  <li><strong>lib/src/data/repository/</strong>: Centralized management of calculator button configurations.</li>
  <li><strong>lib/src/data/util/</strong>: Utility classes.</li>
  <li><strong>lib/src/data/helper/</strong>: Helper classes.</li>
</ul>


<br>
<h2>🎯 Final Thoughts</h2>
<p align="center"><em>This project demonstrates how MVI, combined with Bloc, improves code organization and predictability, ensuring a secure, scalable, and testable data flow.<br>Although MVI is a more advanced pattern, its use provides significant benefits for reactive and large-scale applications, where state control is crucial.
</em></p>

<p align="center"><em>I appreciate your interest in this study and hope it serves as a valuable learning resource and reference. 🚀</em></p>
<p align="center"><em>🙏 May Jesus bless you all!</em></p>
