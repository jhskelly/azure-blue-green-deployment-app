package com.developingjudoka.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import java.io.IOException;
import java.util.Random;

@Slf4j
@Component
@ServerEndpoint("/data")
public class WebSocketDataGenerator {

    @OnOpen
    public void onOpen(Session session) throws Exception {
        ObjectMapper obj = new ObjectMapper();

        while (true) {
            int randomNumber = generateRandomNumber();
            String randomColour = generateRandomColor();
            session.getBasicRemote().sendText(obj.writeValueAsString(new Message(randomNumber,randomColour)));
            Thread.sleep(2000);
            log.info("WebSocket opened: " + session.getId());
        }
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException, InterruptedException {
        log.info("Recieved");
    }

    @OnClose
    public void onClose(Session session) {
        log.info("WebSocket closed: " + session.getId());
    }

    private int generateRandomNumber() {
        return new Random().nextInt(100) + 1;
    }

    private String generateRandomColor() {
        String[] colors = {"red", "blue", "green", "yellow", "orange", "purple"};
        return colors[new Random().nextInt(colors.length)];
    }
    static class Message {
        private int number;
        private String color;

        public Message(int number, String color) {
            this.number = number;
            this.color = color;
        }

        public int getNumber() {
            return number;
        }

        public String getColor() {
            return color;
        }
    }
}