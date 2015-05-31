class PagesController < ApplicationController
  def homepage
    @exec_board = [
      {
        name: 'Carolyn Chang',
        position: 'Co-President'
      },
      {
        name: 'Jenny  Lohmeier',
        position: 'Co-President'
      },
      {
        name: 'Tanya Talkar',
        position: 'VP Internal Relations'
      },
      {
        name: 'Angela Cui',
        position: 'VP Corporate Relations'
      },
      {
        name: 'Fiona Lam',
        position: 'VP Finance'
      },
      {
        name: 'Uma Girkar',
        position: 'VP Operations'
      },
      {},
      {
        name: 'Sylvia Atsaves',
        position: 'VP Marketing'
      },
      {}
    ]
  end
end
