package com.websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadcasting")

public class Broadsocket {



	private static Set<Session> clients = Collections

			.synchronizedSet(new HashSet<Session>());



	@OnMessage

	public void onMessage(String message, Session session) throws IOException {

		System.out.println(message);

		synchronized (clients) {

			//연결된 세션을 반복하고 받은 메세지를 broadcast한다.

			for (Session client : clients) {

				if (!client.equals(session)) {

					client.getBasicRemote().sendText(message);

				}

			}

		}

	}



	@OnOpen

	public void onOpen(Session session) {

		// 연결된 세션을 설정하고 세션추가

		System.out.println(session);

		clients.add(session);

	}



	@OnClose

	public void onClose(Session session) {

		// 설정된 세션을 삭제

		clients.remove(session);

	}

}