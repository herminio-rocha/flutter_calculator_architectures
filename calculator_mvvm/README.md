<h1 align="center">Calculator - MVVM</h1>

<br>
<p align="center">
  <strong>🇧🇷 Português</strong>
</p>

<h2>✨ Sobre o Projeto</h2>
<p>O Calculator MVVM é um projeto desenvolvido em Flutter, estruturado seguindo o padrão arquitetural MVVM (Model-View-ViewModel). O objetivo deste projeto é demonstrar como organizar um código modular, escalável e desacoplado, separando a lógica de negócios da interface de usuário e facilitando a manutenção.

Este projeto faz parte do repositório Flutter Calculator Architectures, onde diferentes abordagens arquiteturais são exploradas e comparadas.</p>

<br>
<h2>📚 O que é MVVM?</h2>
<p>O Model-View-ViewModel (MVVM) é um padrão arquitetural que melhora a separação de responsabilidades, garantindo uma maior organização do código. Ele divide a aplicação em três camadas principais:</p>
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
        <td align="center">Gerencia os dados e a lógica de negócios. Não se comunica diretamente com a interface.</td>
        <td align="center"><i>Calculation, CalculatorModel, MathExpressionProcessor</i></td>
      </tr>
      <tr>
        <td align="center">View</td>
        <td align="center">Responsável por exibir a interface gráfica e capturar interações do usuário. Não contém lógica de negócios.</td>
        <td align="center"><i>AndroidCalculatorView, IosCalculatorView</i></td>
      </tr>
      <tr>
        <td align="center">ViewModel</td>
        <td align="center">Atua como intermediário entre Model e View. Mantém o estado da UI e fornece dados prontos para exibição.</td>
        <td align="center"><i>CalculatorViewModel</i></td>
      </tr>
    </tbody>
  </table>
</div>
<p>Diferente do MVC, onde a View depende do Controller para atualizar a UI, no MVVM a ViewModel mantém o estado da interface de forma reativa, desacoplando completamente a lógica de negócios da interface gráfica.</p>

<h3>📌 Decisões Técnicas</h3>
<ul>
  <li>Repository atua como a única fonte de entrada dos dados, nesse caso usada para as configurações dos botões.</li>
  <li>Views foram separadas por plataforma (Android e iOS).</li>
</ul>

<br>
<h2>🚀 Por que usar MVVM?</h2>
<p>O MVVM é uma evolução natural para projetos que precisam de maior flexibilidade e organização na manipulação do estado da interface. Algumas vantagens incluem:</p>
<ul>
  <li><strong>Separação Total de Responsabilidades</strong>: A ViewModel desacopla a interface da lógica de negócios, tornando o código mais modular.</li>
  <li><strong>Facilidade de Testes</strong>: Como a lógica está isolada na ViewModel, os testes unitários se tornam mais simples e eficazes.</li>
  <li><strong>Melhor Escalabilidade</strong>: Ideal para aplicações mais complexas, onde a separação de estados é essencial.</li>
  <li><strong>Código mais limpo e organizado</strong>: Reduz a dependência direta entre UI e Model, facilitando a manutenção.</li>
</ul>

<br>
<h2>🔎 Como o MVVM funciona neste projeto?</h2>
<ol>
  <li><strong>O usuário interage com a View</strong>: Pressiona um botão na calculadora.</li>
  <li><strong>A View delega a ação para a ViewModel</strong>: Atravéz de DataBinding</li>
  <li><strong>O ViewModel processa a ação e delega a ação para o Model</strong>: calculatorModel.add();</li>
  <li><strong>O Model executa a lógica</strong>: Realiza o cálculo.</li>
  <li><strong>A ViewModel notifica a View sobre as mudanças</strong>: notifyListeners();</li>
  <li><strong>A View escuta as atualizações e reflete os novos valores na interface</strong>: Atravéz de DataBinding</li>
</ol>

<br>
<h2>🏗 Estrutura do Código</h2>
<p>A organização do projeto segue a estrutura padrão do Flutter, adaptada ao MVVM, garantindo clareza e modularidade:</p>
<ul>
  <li><strong>lib/</strong>: Código-fonte principal do projeto.</li>
  <li><strong>lib/model/</strong>: Lógica de cálculo, manipulação de dados e regras de negócio.</li>
  <li><strong>lib/view/</strong>: Telas e widgets da interface gráfica.</li>
  <li><strong>lib/viewmodel/</strong>: Camada intermediária que gerencia o estado da UI e se comunica com o Model.</li>
  <li><strong>lib/repository/</strong>: Centraliza a configuração dos botões da calculadora.</li>
  <li><strong>lib/util: </strong>: Classes utilitárias.</li>
  <li><strong>lib/helper: </strong>: Classes helper.</li>
</ul>


<br>
<h2>🎯 Considerações Finais</h2>
<p align="center"><em>Este projeto demonstra como o MVVM pode melhorar a organização e escalabilidade do código, tornando a separação entre lógica e UI mais eficiente. Embora seja um padrão mais avançado que o MVC, seu uso traz grandes benefícios para aplicações de médio a grande porte.</em></p>
<p align="center"><em>Agradeço por explorar este estudo e espero que ele seja útil para aprendizado, referência e inspiração. 🚀</em></p>
<p align="center"><em>Jesus abençoe a todos 🙏</em></p>
<h2></h2>
<br>

<br>
<p align="center">
  <strong>🇺🇸 English</strong>
</p>

<h2>✨ About the Project</h2>
<p>The Calculator MVVM is a project developed in Flutter, structured following the MVVM (Model-View-ViewModel) architectural pattern. The objective of this project is to demonstrate how to organize modular, scalable, and decoupled code, separating business logic from the user interface and facilitating maintenance.

This project is part of the Flutter Calculator Architectures repository, where different architectural approaches are explored and compared.</p>

<br>
<h2>📚 What is MVVM?</h2>
<p>Model-View-ViewModel (MVVM) is an architectural pattern that improves the separation of concerns, ensuring better code organization. It divides the application into three main layers:</p>
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
        <td align="center">Manages data and business logic. It does not communicate directly with the interface.</td>
        <td align="center"><i>Calculation, CalculatorModel, MathExpressionProcessor</i></td>
      </tr>
      <tr>
        <td align="center">View</td>
        <td align="center">Responsible for displaying the graphical interface and capturing user interactions. It does not contain business logic.</td>
        <td align="center"><i>AndroidCalculatorView, IosCalculatorView</i></td>
      </tr>
      <tr>
        <td align="center">ViewModel</td>
        <td align="center">Acts as an intermediary between Model and View. Maintains UI state and provides data ready for display.</td>
        <td align="center"><i>CalculatorViewModel</i></td>
      </tr>
    </tbody>
  </table>
</div>

<h3>📌 Technical Decisions</h3>
<ul>
  <li>The Repository serves as the single source of truth for button configurations.</li>
  <li>Views are separated by platform (Android and iOS).</li>
</ul>

<br>
<h2>🚀 Why Use MVVM?</h2>
<p>MVVM is a natural evolution for projects that require better flexibility and organization in UI state management. Some key benefits include:</p>
<ul>
  <li><strong>Complete Separation of Concerns</strong>: The ViewModel decouples UI from business logic, making the code more modular.</li>
  <li><strong>Easier Unit Testing</strong>: Since business logic is isolated within the ViewModel, testing becomes simpler and more effective.</li>
  <li><strong>Improved Scalability</strong>: Ideal for complex applications where state management is essential.</li>
  <li><strong>Cleaner and More Organized Code</strong>: Reduces direct dependencies between UI and Model, facilitating maintenance.</li>
</ul>

<br>
<h2>🔎 How Does MVVM Work in This Project?</h2>
<ol>
  <li><strong>The user interacts with the View</strong>: Pressing a button on the calculator.</li>
  <li><strong>The View delegates the action to the ViewModel</strong>: Through DataBinding</li>
  <li><strong>The ViewModel processes the action and delegates the action to the Model</strong>: calculatorModel.add();</li>
  <li><strong>Model executes the logic</strong>: Perform the calculation.</li>
  <li><strong>The ViewModel notifies the View about changes</strong>: notifyListeners();</li>
  <li><strong>The View listens for updates and reflects the new values ​​in the interface</strong>: Through DataBinding</li>
</ol>

<br>
<h2>🏗 Project Structure</h2>
<p>The project follows the standard Flutter structure, adapted for MVC to ensure clarity and modularity:</p>
<ul>
  <li><strong>lib/</strong>: Main project source code.</li>
  <li><strong>lib/model/</strong>: Handles business logic and data processing.</li>
  <li><strong>lib/view/</strong>: UI screens and widgets.</li>
  <li><strong>lib/viewmodel/</strong>: Manages UI state and communicates with the Model.</li>
  <li><strong>lib/repository/</strong>: Centralized management of calculator button configurations.</li>
  <li><strong>lib/util: </strong>: Utility classes.</li>
  <li><strong>lib/helper: </strong>: Helper classes.</li>
</ul>


<br>
<h2>🎯 Final Thoughts</h2>
<p align="center"><em>This project demonstrates how MVVM enhances code organization and scalability by improving the separation between logic and UI. Although it is a more advanced pattern than MVC, its use provides significant benefits for medium to large-scale applications.</em></p>
<p align="center"><em>I appreciate your interest in this study and hope it serves as a valuable learning resource and reference. 🚀</em></p>
<p align="center"><em>🙏 May Jesus bless you all!</em></p>
