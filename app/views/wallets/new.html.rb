<h1>New Wallet</h1>

<%= form_for @wallet do |f| %>
  <% if @wallet.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@wallet.errors.count, "error") %> prohibited this wallet from being saved:</h2>

      <ul>
      <% @wallet.errors.full_messages.each do |msg| %>
        <li><%= msg %></li>
      <% end %>
      </ul>
    </div>
  <% end %>

  <div class="field">
    <%= f.label :balance %>
    <%= f.number_field :balance, step: "0.01", min: 0, required: true %>
  </div>

  <div class="field">
    <%= f.label :currency %>
    <%= f.select :currency, options_for_select([['USD', 'USD'], ['EUR', 'EUR'], ['GBP', 'GBP']]), {}, required: true %>
  </div>

  <div class="actions">
    <%= f.submit 'Create Wallet' %>
  </div>
<% end %>

<%= link_to 'Back', wallets_path %>
