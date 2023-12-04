// app/javascript/controllers/chat_controller.js

import { Controller } from 'stimulus';
import consumer from '../channels/consumer';

export default class extends Controller {
  static targets = ['messages', 'input'];

  connect() {
    this.setupSubscription();
    this.setupEnterKeyListener();
  }

  setupSubscription() {
    const chatId = this.data.get('chatId');
    if (chatId) {
      const chatChannel = consumer.subscriptions.create({ channel: 'ChatChannel', chat_id: chatId }, {
        received: (data) => {
          this.appendMessage(data);
        },
      });

      this.chatChannel = chatChannel;
    }
  }

  setupEnterKeyListener() {
    this.inputTarget.addEventListener('keypress', (event) => {
      if (event.key === 'Enter') {
        event.preventDefault();
        this.sendMessage();
      }
    });
  }

  appendMessage(data) {
    const messageElement = document.createElement('div');
    messageElement.innerHTML = data.message;
    this.messagesTarget.appendChild(messageElement);
  }

  sendMessage() {
    const content = this.inputTarget.value;
    if (content.trim() !== '') {
      const chatId = this.data.get('chatId');
      this.chatChannel.send({ content, chat_id: chatId });
      this.inputTarget.value = '';
    }
  }
}
