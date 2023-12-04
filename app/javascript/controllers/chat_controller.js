import { Controller } from '@hotwired/stimulus';
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ['messages', 'input'];
  static values = { chatid: Number }

  connect() {
    this.setupSubscription();
    this.setupEnterKeyListener();

    console.log(this.chatidValue);
  }

  setupSubscription() {
    const chatId = this.chatidValue


      const chatChannel = createConsumer().subscriptions.create({ channel: 'ChatChannel', chat_id: chatId }, {
        received: (data) => {
          console.log('hola');
          this.appendMessage(data);
        },
      });

      this.chatChannel = chatChannel;

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
    console.log(data);
  
    messageElement.innerHTML = data;
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
